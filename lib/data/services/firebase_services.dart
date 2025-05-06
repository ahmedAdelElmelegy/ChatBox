import 'dart:io';

import 'package:chat_box/data/models/chat_model.dart';
import 'package:chat_box/data/models/login_user_model.dart';
import 'package:chat_box/data/models/story_model.dart';
import 'package:chat_box/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseStorage _storage = FirebaseStorage.instance;
  Future<UserCredential> login(LoginUserModel loginBody) async {
    try {
      return _auth.signInWithEmailAndPassword(
        email: loginBody.email,
        password: loginBody.password,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> signUp(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUser(UserModel userModel) async {
    await _firestore
        .collection('users')
        .doc(userModel.uid)
        .set(userModel.toMap());
  }

  Future<UserModel> getUserData(String uid) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('users').doc(uid).get();
      return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  User? get currentUser => _auth.currentUser;
  // get all user
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final snapshot = await _firestore.collection('users').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  // story
  Future<String> uploadStory(File file) async {
    final fileId = const Uuid().v4();
    final ref = _storage.ref().child('stories/$fileId.jpg');
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }

  Future<void> createStory(StoryModel storyModel) async {
    await _firestore.collection('stories').add(storyModel.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStories() {
    return _firestore.collection('stories').snapshots();
  }

  //  // chat

  // Stream<List<MessageModel>> getMessage(String chatId) {
  //   return _firestore
  //       .collection('chats')
  //       .doc(chatId)
  //       .collection('messages')
  //       .orderBy('timestamp', descending: true)
  //       .snapshots()
  //       .map((snapshot) {
  //         return snapshot.docs
  //             .map((doc) => MessageModel.fromMap(doc.data()))
  //             .toList();
  //       });
  // }

  // Future<void> sendMessage({
  //   required String chatId,
  //   required String receiverId,
  //   required String senderId,
  //   required String text,
  // }) async {
  //   final messageRef =
  //       _firestore.collection('chats').doc(chatId).collection('messages').doc();
  //   final message = MessageModel(
  //     id: messageRef.id,
  //     senderId: senderId,
  //     receiverId: receiverId,
  //     message: text,
  //     timestamp: DateTime.now(),
  //     isSeen: false,
  //   );
  //   await messageRef.set(message.toMap());
  //   await _firestore.collection('chats').doc(chatId).set({
  //     'users': [senderId, receiverId],
  //     'lastMessage': text,
  //     'lastSenderId': senderId,
  //     'lastTime': Timestamp.now(),
  //     'unreadCounts.$receiverId': FieldValue.increment(1),
  //   }, SetOptions(merge: true));
  // }

  // Future<void> markMessagesAsRead(String chatId, String userId) async {
  //   final messageRef = _firestore
  //       .collection('chats')
  //       .doc(chatId)
  //       .collection('messages');
  //   final unread =
  //       await messageRef
  //           .where('receiverId', isEqualTo: userId)
  //           .where('isSeen', isEqualTo: false)
  //           .get();

  //   for (final doc in unread.docs) {
  //     await doc.reference.update({'isSeen': true});
  //   }
  //   await _firestore.collection('chats').doc(chatId).set({
  //     'unreadCounts.$userId': 0,
  //   });
  // }

  // Stream<List<ChatModel>>  getUserChats(String uid) {
  //   return _firestore
  //       .collection('chats')
  //       .where('users', arrayContains: uid)
  //       .orderBy('lastTime', descending: true)
  //       .snapshots()
  //       .map(
  //         (snap) =>
  //             snap.docs
  //                 .map((doc) => ChatModel.fromMap(doc.id, doc.data()))
  //                 .toList(),
  //       );
  // }
  // me
  Future<void> sendMessage(ChatMessage message) async {
    final chatId = _getChatId(message.senderId, message.receiverId);
    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(message.toMap());
  }

  String _getChatId(String user1, String user2) {
    final sorted = [user1, user2]..sort();
    return '${sorted[0]}_${sorted[1]}';
  }

  Stream<List<ChatMessage>> getMessage(String senderId, String receiverId) {
    final chatId = _getChatId(senderId, receiverId);
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => ChatMessage.fromMap(doc.data()))
              .toList();
        });
  }

  Future<void> setTypingStatus({
    required String chatId,
    required String userId,
    required bool isTyping,
  }) async {
    await _firestore.collection('chats').doc(chatId).set({
      'typingStatus': {userId: isTyping},
    }, SetOptions(merge: true));
  }

  Stream<bool> isUserTyping(String chatId, String userId) {
    return _firestore.collection('chats').doc(chatId).snapshots().map((doc) {
      final data = doc.data();
      if (data == null) return false;
      final status = data['typingStatus'] as Map<String, dynamic>?;
      return status?[userId] == true;
    });
  }
}
