part of 'get_all_users_cubit.dart';

sealed class GetAllUsersState {}

final class GetAllUsersInitial extends GetAllUsersState {}

final class GetAllUsersLoading extends GetAllUsersState {}

final class GetAllUsersFailure extends GetAllUsersState {
  final String message;
  GetAllUsersFailure(this.message);
}

final class GetAllUsersSucess extends GetAllUsersState {}
