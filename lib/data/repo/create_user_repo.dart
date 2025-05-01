import 'package:chat_box/core/error/failure.dart';
import 'package:chat_box/data/models/user_model.dart';
import 'package:chat_box/data/services/firebase_services.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUserRepo {
  FirebaseServices firebaseServices;
  CreateUserRepo(this.firebaseServices);
  Future<Either<Failure, String>> createUser(UserModel userModel) async {
    try {
      await firebaseServices.createUser(userModel);
      return const Right('User Create Successfully');
    } on FirebaseException catch (e) {
      return left(FirebaseFailure(e.toString()));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }
}
