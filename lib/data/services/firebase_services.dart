import 'package:chat_box/data/models/body/login_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> login(LoginUserModel loginBody) async {
    try {
      return _auth.signInWithEmailAndPassword(
        email: loginBody.email,
        password: loginBody.password,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> signUp(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  User? get currentUser => _auth.currentUser;
}
