part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}

final class LoginSucess extends LoginState {
  final String message;
  LoginSucess(this.message);
}
