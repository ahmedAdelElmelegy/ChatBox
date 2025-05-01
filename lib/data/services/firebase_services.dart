import 'dart:io';

import 'package:chat_box/data/models/login_user_model.dart';
import 'package:chat_box/data/models/story_model.dart';
import 'package:chat_box/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseStorage _storage = FirebaseStorage.instance;
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

  Future<void> createUser(UserModel userModel) async {
    await _firestore
        .collection('users')
        .doc(userModel.uid)
        .set(userModel.toMap());
  }

  Future<UserModel> getUserData(String uid) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('users').doc(uid).get();
      return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  User? get currentUser => _auth.currentUser;

  // story
  Future<String> uploadStory(File file) async {
    final fileId = const Uuid().v4();
    final ref = _storage.ref().child('stories/$fileId.jpg');
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }

  Future<void> CreateStory(StoryModel storyModel) async {
    await _firestore.collection('stories').add(storyModel.toMap());
  }
}
