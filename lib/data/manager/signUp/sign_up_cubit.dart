import 'package:chat_box/core/di/injection.dart';
import 'package:chat_box/core/helpers/extentions.dart';
import 'package:chat_box/data/manager/login/login_cubit.dart';
import 'package:chat_box/data/models/user_model.dart';
import 'package:chat_box/data/repo/create_user_repo.dart';
import 'package:chat_box/data/repo/sign_up_repo.dart';
import 'package:chat_box/feature/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo, this.createUserRepo) : super(SignUpInitial());
  SignUpRepo signUpRepo;
  CreateUserRepo createUserRepo;
  final emailKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final logincubit = getIt<LoginCubit>();

  static SignUpCubit get(context) => BlocProvider.of(context);

  Future<void> signUp(String email, String password, String image) async {
    emit(SignUpLoading());
    final result = await signUpRepo.signUp(email, password);
    result.fold(
      (l) {
        emit(SignUpFailure());
        Fluttertoast.showToast(msg: l.message);
      },
      (r) async {
        UserModel userModel = UserModel(
          uid: r.user!.uid,
          email: emailController.text,
          name: nameController.text,
          image: image,
        );
        await createUser(userModel);
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        nameController.clear();
        Fluttertoast.showToast(msg: 'Create User Successfully');

        emit(SignUpSucess());
        logincubit.emailController.text = email;
        logincubit.passwordController.text = password;
        push(LoginScreen());
      },
    );
  }

  Future<void> createUser(UserModel userModel) async {
    final result = await createUserRepo.createUser(userModel);
    result.fold(
      (l) {
        emit(SignUpFailure());
        Fluttertoast.showToast(msg: l.message);
      },
      (r) {
        Fluttertoast.showToast(msg: r);
        emit(SignUpSucess());
      },
    );
  }
}
