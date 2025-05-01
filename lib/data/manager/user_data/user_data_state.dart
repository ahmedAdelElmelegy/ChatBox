part of 'user_data_cubit.dart';

sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class UserDataLoading extends UserDataState {}

final class UserDataSucess extends UserDataState {
  final UserModel userModel;

  UserDataSucess(this.userModel);
}

final class UserDataFailure extends UserDataState {
  final String message;

  UserDataFailure(this.message);
}
