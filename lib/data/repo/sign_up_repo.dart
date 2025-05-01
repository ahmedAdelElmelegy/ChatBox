import 'package:chat_box/core/error/failure.dart';
import 'package:chat_box/data/services/firebase_services.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepo {
  final FirebaseServices firebaseServices;
  SignUpRepo(this.firebaseServices);

  Future<Either<Failure, UserCredential>> signUp(
    String email,
    String password,
  ) async {
    try {
      final result = await firebaseServices.signUp(email, password);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromException(e));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }
}
