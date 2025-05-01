import 'package:bloc/bloc.dart';
import 'package:chat_box/core/helpers/extentions.dart';
import 'package:chat_box/data/models/login_user_model.dart';
import 'package:chat_box/data/repo/login_repo.dart';
import 'package:chat_box/feature/main_screen.dart';
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
        Fluttertoast.showToast(msg: sucess);
        pushAndRemoveUntil(MainScreen());
        emit(LoginSucess(sucess));
      },
    );
  }
}
