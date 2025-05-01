import 'package:firebase_core/firebase_core.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(super.message);

  factory FirebaseFailure.fromException(FirebaseException exception) {
    switch (exception.code) {
      case 'weak-password':
        return FirebaseFailure('The password provided is too weak.');
      case 'email-already-in-use':
        return FirebaseFailure('The account already exists for that email.');
      case 'invalid-email':
        return FirebaseFailure('The email address is not valid.');
      case 'user-disabled':
        return FirebaseFailure('This user has been disabled.');
      case 'user-not-found':
        return FirebaseFailure('No user found with this email.');
      case 'wrong-password':
        return FirebaseFailure('The password is incorrect.');

      case 'operation-not-allowed':
        return FirebaseFailure(
          'Operation not allowed. Please contact support.',
        );
      default:
        return FirebaseFailure(exception.toString());
    }
  }
}
