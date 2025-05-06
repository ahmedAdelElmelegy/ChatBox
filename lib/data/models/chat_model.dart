// chat_model.dart
class ChatMessage {
  final String senderId;
  final String receiverId;
  final String message;
  final DateTime timestamp;

  ChatMessage({
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      message: map['message'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}


// // firebase_chat_service.dart
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/chat_model.dart';

// class FirebaseChatService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> sendMessage(ChatMessage message) async {
//     final chatId = _getChatId(message.senderId, message.receiverId);
//     await _firestore.collection('chats').doc(chatId).collection('messages').add(message.toMap());
//   }

//   Stream<List<ChatMessage>> getMessages(String senderId, String receiverId) {
//     final chatId = _getChatId(senderId, receiverId);
//     return _firestore
//         .collection('chats')
//         .doc(chatId)
//         .collection('messages')
//         .orderBy('timestamp')
//         .snapshots()
//         .map((snapshot) => snapshot.docs
//             .map((doc) => ChatMessage.fromMap(doc.data()))
//             .toList());
//   }

//   Future<void> setTypingStatus({
//     required String chatId,
//     required String userId,
//     required bool isTyping,
//   }) async {
//     await _firestore.collection('chats').doc(chatId).set({
//       'typingStatus': {userId: isTyping},
//     }, SetOptions(merge: true));
//   }

//   Stream<bool> isUserTyping(String chatId, String userId) {
//     return _firestore.collection('chats').doc(chatId).snapshots().map((doc) {
//       final data = doc.data();
//       if (data == null) return false;
//       final status = data['typingStatus'] as Map<String, dynamic>?;
//       return status?[userId] == true;
//     });
//   }

//   String _getChatId(String user1, String user2) {
//     final sorted = [user1, user2]..sort();
//     return '${sorted[0]}_${sorted[1]}';
//   }
// }


// // chat_repo.dart
// import '../models/chat_model.dart';
// import '../services/firebase_chat_service.dart';

// class ChatRepo {
//   final FirebaseChatService service;
//   ChatRepo(this.service);

//   Future<void> sendMessage(ChatMessage message) => service.sendMessage(message);

//   Stream<List<ChatMessage>> getMessages(String senderId, String receiverId) =>
//       service.getMessages(senderId, receiverId);

//   Future<void> setTypingStatus(String chatId, String userId, bool isTyping) =>
//       service.setTypingStatus(chatId: chatId, userId: userId, isTyping: isTyping);

//   Stream<bool> isUserTyping(String chatId, String userId) =>
//       service.isUserTyping(chatId, userId);
// }


// // chat_cubit.dart
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../models/chat_model.dart';
// import '../repo/chat_repo.dart';

// part 'chat_state.dart';

// class ChatCubit extends Cubit<ChatState> {
//   final ChatRepo repo;
//   ChatCubit(this.repo) : super(ChatInitial());

//   void sendMessage(ChatMessage message) async {
//     await repo.sendMessage(message);
//   }

//   Stream<List<ChatMessage>> getMessages(String senderId, String receiverId) {
//     return repo.getMessages(senderId, receiverId);
//   }

//   void setTyping(String chatId, String userId, bool isTyping) {
//     repo.setTypingStatus(chatId, userId, isTyping);
//   }

//   Stream<bool> isUserTyping(String chatId, String userId) {
//     return repo.isUserTyping(chatId, userId);
//   }
// }


// // chat_state.dart
// part of 'chat_cubit.dart';

// abstract class ChatState {}

// class ChatInitial extends ChatState {}

// class ChatLoading extends ChatState {}

// class ChatLoaded extends ChatState {
//   final List<ChatMessage> messages;
//   ChatLoaded(this.messages);
// }

// class ChatError extends ChatState {
//   final String error;
//   ChatError(this.error);
// }
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatModel {
//   final String chatId;
//   final List<String> users; // user1 and user2 uids
//   final String lastMessage;
//   final String lastMessageSenderId;
//   final DateTime lastMessageTime;
//   final Map<String, int> unreadCounts; // uid -> count

//   ChatModel({
//     required this.chatId,
//     required this.users,
//     required this.lastMessage,
//     required this.lastMessageSenderId,
//     required this.lastMessageTime,
//     required this.unreadCounts,
//   });

//   factory ChatModel.fromMap(String id, Map<String, dynamic> map) {
//     return ChatModel(
//       chatId: id,
//       users: List<String>.from(map['users']),
//       lastMessage: map['lastMessage'] ?? '',
//       lastMessageSenderId: map['lastMessageSenderId'] ?? '',
//       lastMessageTime: (map['lastMessageTime'] as Timestamp).toDate(),
//       unreadCounts: Map<String, int>.from(map['unreadCounts'] ?? {}),
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'users': users,
//       'lastMessage': lastMessage,
//       'lastMessageSenderId': lastMessageSenderId,
//       'lastMessageTime': Timestamp.fromDate(lastMessageTime),
//       'unreadCounts': unreadCounts,
//     };
//   }
// }
