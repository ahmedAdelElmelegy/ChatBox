import 'dart:async';

import 'package:chat_box/data/models/user_model.dart';
import 'package:chat_box/data/repo/get_all_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_users_state.dart';

class GetAllUsersCubit extends Cubit<GetAllUsersState> {
  GetAllUsersCubit(this.getAllUserRepo) : super(GetAllUsersInitial());
  GetAllUserRepo getAllUserRepo;
  List<UserModel>? userModel = [];
  static GetAllUsersCubit get(context) => BlocProvider.of(context);
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<void> getAllUsers() async {
    emit(GetAllUsersLoading());

    final result = await getAllUserRepo.getAllUsers();
    result.fold(
      (failure) {
        emit(GetAllUsersFailure(failure.message));
      },
      (users) {
        final currentUid = firebaseAuth.currentUser?.uid;
        userModel = users.where((user) => user.uid != currentUid).toList();
        emit(GetAllUsersSucess());
      },
    );
  }
}
