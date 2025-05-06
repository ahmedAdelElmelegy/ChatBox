import 'dart:io';

import 'package:chat_box/data/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(MessageModel msg) async {
    final chatId = _getChatId(msg.senderId, msg.receiverId);
    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(msg.id)
        .set(msg.toMap());

    await _firestore.collection('chats').doc(chatId).set({
      'lastMessage': msg.content,
      'timestamp': msg.timestamp.toIso8601String(),
      'unwatchedCount_${msg.receiverId}': FieldValue.increment(1),
      'lastMessageType': msg.type.name,
      'senderId': msg.senderId,
    }, SetOptions(merge: true));
  }

  Stream<List<MessageModel>> getMessages(String senderId, String receiverId) {
    final chatId = _getChatId(senderId, receiverId);
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp')
        .snapshots()
        .map(
          (snap) =>
              snap.docs.map((e) => MessageModel.fromMap(e.data())).toList(),
        );
  }

  Future<void> markAsWatched(String senderId, String receiverId) async {
    final chatId = _getChatId(senderId, receiverId);
    final snapshot =
        await _firestore
            .collection('chats')
            .doc(chatId)
            .collection('messages')
            .where('receiverId', isEqualTo: senderId)
            .where('isWatched', isEqualTo: false)
            .get();

    for (var doc in snapshot.docs) {
      doc.reference.update({'isWatched': true});
    }

    await _firestore.collection('chats').doc(chatId).update({
      'unwatchedCount_$senderId': 0,
    });
  }

  String _getChatId(String id1, String id2) =>
      id1.hashCode <= id2.hashCode ? '${id1}_$id2' : '${id2}_$id1';
}
