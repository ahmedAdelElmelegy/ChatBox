// import 'package:chat_box/core/error/failure.dart';
// import 'package:chat_box/data/models/chat_model.dart';
// import 'package:chat_box/data/services/firebase_services.dart';
// import 'package:dartz/dartz.dart';

// class ChatRepo {
//   final FirebaseServices service;
//   ChatRepo(this.service);

//   // Future<Either<Failure, void>> createChat(String chatId) async {
//   //   try {
//   //     await service.(chatId);
//   //     return const Right(null);
//   //   } catch (e) {
//   //     return Left(FirebaseFailure(e.toString()));
//   //   }
//   // }
//   Future<Either<Failure, void>> sendMessage(ChatMessage message) async {
//     try {
//       await service.sendMessage(message);
//       return const Right(null);
//     } catch (e) {
//       return Left(FirebaseFailure(e.toString()));
//     }
//   }
// }
import 'package:chat_box/core/error/failure.dart';
import 'package:chat_box/data/models/message_model.dart';
import 'package:chat_box/data/services/chat_services.dart';
import 'package:dartz/dartz.dart';

class ChatRepo {
  final ChatServices chatServices;

  ChatRepo(this.chatServices);
  Future<Either<Failure, void>> sendMessage(MessageModel message) async {
    try {
      await chatServices.sendMessage(message);
      return const Right(null);
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }

  Future<Either<Failure, Stream<List<MessageModel>>>> getMessages(
    String senderId,
    String receiverId,
  ) async {
    try {
      final result = chatServices.getMessages(senderId, receiverId);
      return right(result);
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }
}
