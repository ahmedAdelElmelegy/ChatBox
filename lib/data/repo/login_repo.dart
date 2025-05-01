import 'package:chat_box/core/error/failure.dart';
import 'package:chat_box/data/models/body/login_user_model.dart';
import 'package:chat_box/data/services/firebase_services.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo {
  final FirebaseServices firebaseServices;

  LoginRepo(this.firebaseServices);
  Future<Either<Failure, String>> login(LoginUserModel loginBody) async {
    try {
      await firebaseServices.login(loginBody);
      return const Right('Login successfully');
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromException(e));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }
}
