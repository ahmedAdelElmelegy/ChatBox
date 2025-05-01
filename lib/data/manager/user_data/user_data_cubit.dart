import 'package:chat_box/data/models/user_model.dart';
import 'package:chat_box/data/repo/get_user_data_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this.getUserDataRepo) : super(UserDataInitial());
  static UserDataCubit get(context) => BlocProvider.of(context);

  GetUserDataRepo getUserDataRepo;
  User? user = FirebaseAuth.instance.currentUser!;
  UserModel? userModel;
  Future<void> getUserData() async {
    emit(UserDataLoading());
    final result = await getUserDataRepo.getUserData(user!.uid);
    result.fold(
      (l) {
        emit(UserDataFailure(l.message));
      },
      (r) {
        userModel = r;
        emit(UserDataSucess(r));
      },
    );
  }
}
