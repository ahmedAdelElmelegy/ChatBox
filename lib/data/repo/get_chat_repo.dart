import 'package:chat_box/core/error/failure.dart';
import 'package:chat_box/data/models/chat_model.dart';
import 'package:chat_box/data/services/firebase_services.dart';
import 'package:dartz/dartz.dart';

class GetChatRepo {
  final FirebaseServices firebaseServices;

  GetChatRepo(this.firebaseServices);
  Either<dynamic, Stream<List<ChatMessage>>> getMessages(
    String senderId,
    String receiverId,
  ) {
    try {
      final result = firebaseServices.getMessage(senderId, receiverId);
      return right(result);
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }

  Future<void> setTypingStatus(String chatId, String userId, bool isTyping) =>
      firebaseServices.setTypingStatus(
        chatId: chatId,
        userId: userId,
        isTyping: isTyping,
      );

  Stream<bool> isUserTyping(String chatId, String userId) =>
      firebaseServices.isUserTyping(chatId, userId);
}
// import 'package:chat_box/core/error/failure.dart';
// import 'package:chat_box/data/models/chat_model.dart';
// import 'package:chat_box/data/services/firebase_services.dart';
// import 'package:dartz/dartz.dart';

// class GetChatRepo {
//   final FirebaseServices firebaseServices;

//   GetChatRepo(this.firebaseServices);

//   Stream<List<ChatModel>> getChats(String uid){
//     return firebaseServices.getUserChats(uid);
//   }
// }
