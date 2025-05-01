import 'package:bloc/bloc.dart';
import 'package:chat_box/data/models/body/login_user_model.dart';
import 'package:chat_box/data/repo/login_repo.dart';
import 'package:flutter/foundation.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  LoginRepo loginRepo;
  void login(String email, String password) async {
    emit(LoginLoading());
    final result = await loginRepo.login(
      LoginUserModel(email: email, password: password),
    );
    result.fold(
      (failure) {
        emit(LoginFailure(failure.message));
      },
      (sucess) {
        emit(LoginSucess(sucess));
      },
    );
  }
}
