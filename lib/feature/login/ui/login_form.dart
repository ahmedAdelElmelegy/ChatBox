import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/utils/validator.dart';
import 'package:chat_box/core/widgets/custom_btn.dart';
import 'package:chat_box/core/widgets/custom_text_field.dart';
import 'package:chat_box/data/manager/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final loginCubit = BlocProvider.of<LoginCubit>(context);

        return Column(
          children: [
            CustomTextField(
              text: 'Your email',
              controller: loginCubit.emailController,
              fromKey: loginCubit.emailFormKey,
              validator: (value) => Validator.validateEmail(value),
            ),
            verticalSpace(30),
            CustomTextField(
              text: 'Password',
              obscureText: true,
              controller: loginCubit.passwordController,
              validator: (value) => Validator.validatePassword(value),
              fromKey: loginCubit.passwordFormKey,
            ),
            verticalSpace(177),
            CustomBtn(
              onPress: () {
                if (loginCubit.emailFormKey.currentState!.validate() &&
                    loginCubit.passwordFormKey.currentState!.validate()) {
                  loginCubit.login(
                    loginCubit.emailController.text,
                    loginCubit.passwordController.text,
                  );
                }
              },

              // grey light loading
              label: 'Log in',
              color:
                  state is LoginLoading
                      ? ColorManager.loading
                      : ColorManager.primary,
              textColor:
                  state is LoginLoading
                      ? ColorManager.grey
                      : ColorManager.white,
            ),
          ],
        );
      },
    );
  }
}
