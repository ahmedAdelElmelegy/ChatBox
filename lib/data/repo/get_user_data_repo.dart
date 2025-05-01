import 'package:chat_box/core/error/failure.dart';
import 'package:chat_box/data/models/user_model.dart';
import 'package:chat_box/data/services/firebase_services.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

class GetUserDataRepo {
  FirebaseServices firebaseServices;

  GetUserDataRepo(this.firebaseServices);
  Future<Either<Failure, UserModel>> getUserData(String uid) async {
    try {
      UserModel result = await firebaseServices.getUserData(uid);
      return Right(result);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure.fromException(e));
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }
}
