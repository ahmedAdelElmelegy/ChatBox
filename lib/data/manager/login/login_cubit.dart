import 'package:bloc/bloc.dart';
import 'package:chat_box/core/helpers/extentions.dart';
import 'package:chat_box/data/models/login_user_model.dart';
import 'package:chat_box/data/repo/login_repo.dart';
import 'package:chat_box/feature/main_screen.dart';
import 'package:chat_box/notifications/services/notification_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  LoginRepo loginRepo;
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login(String email, String password) async {
    emit(LoginLoading());
    final result = await loginRepo.login(
      LoginUserModel(email: email, password: password),
    );
    result.fold(
      (failure) {
        Fluttertoast.showToast(msg: failure.message);
        emit(LoginFailure(failure.message));
      },
      (sucess) {
        emailController.clear();
        passwordController.clear();
        checkUserToken();
        Fluttertoast.showToast(msg: sucess);
        pushAndRemoveUntil(MainScreen());
        emit(LoginSucess(sucess));
      },
    );
  }

  Future<void> checkUserToken() async {
    try {
      String token = await NotificationServices.getToken();
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      // Get a reference to the user's document
      final DocumentSnapshot<Map<String, dynamic>> doc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(firebaseAuth.currentUser!.uid)
              .get();

      if (doc.exists) {
        final userData = doc.data();
        final userToken = userData?['userToken'];

        if (userToken != token) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(firebaseAuth.currentUser!.uid)
              .update({'userToken': token});
        } else {
          print('✅ User token is up-to-date for uid');
        }
      }
    } catch (e) {
      print('🔥 Error fetching usertoken: $e');
    }
  }
}
