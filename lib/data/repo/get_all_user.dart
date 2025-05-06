import 'package:chat_box/core/error/failure.dart';
import 'package:chat_box/data/models/user_model.dart';
import 'package:chat_box/data/services/firebase_services.dart';
import 'package:dartz/dartz.dart';

class GetAllUserRepo {
  final FirebaseServices service;
  GetAllUserRepo(this.service);
  Future<Either<Failure, List<UserModel>>> getAllUsers() async {
    try {
      final data = await service.getAllUsers();
      final users = data.map((e) => UserModel.fromMap(e)).toList();
      return Right(users);
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }
}
