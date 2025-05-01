import 'package:firebase_core/firebase_core.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(super.message);

  factory FirebaseFailure.fromException(FirebaseException exception) {
    switch (exception.code) {
      case 'invalid-email':
        return FirebaseFailure('The email address is not valid.');
      case 'user-disabled':
        return FirebaseFailure('This user has been disabled.');
      case 'user-not-found':
        return FirebaseFailure('No user found with this email.');
      case 'wrong-password':
        return FirebaseFailure('The password is incorrect.');
      case 'email-already-in-use':
        return FirebaseFailure('This email is already in use.');
      case 'operation-not-allowed':
        return FirebaseFailure(
          'Operation not allowed. Please contact support.',
        );
      case 'weak-password':
        return FirebaseFailure('The password is too weak.');
      default:
        return FirebaseFailure('An unknown Firebase error occurred.');
    }
  }
}
