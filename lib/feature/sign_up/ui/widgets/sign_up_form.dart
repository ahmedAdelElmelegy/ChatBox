import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/utils/app_constants.dart';
import 'package:chat_box/core/utils/validator.dart';
import 'package:chat_box/core/widgets/custom_btn.dart';
import 'package:chat_box/core/widgets/custom_text_field.dart';
import 'package:chat_box/data/manager/signUp/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final cubit = SignUpCubit.get(context);
        return Column(
          children: [
            CustomTextField(
              text: 'Your name',
              controller: cubit.nameController,
            ),
            verticalSpace(30),
            CustomTextField(
              text: 'Your email',
              controller: cubit.emailController,
              fromKey: cubit.emailKey,
              validator: (value) => Validator.validateEmail(value),
            ),
            verticalSpace(30),

            CustomTextField(
              text: 'Password',
              obscureText: true,
              controller: cubit.passwordController,
              fromKey: cubit.passwordKey,
              validator: (p0) => Validator.validatePassword(p0),
            ),
            verticalSpace(30),
            CustomTextField(
              text: 'Confirm password',
              obscureText: true,
              validator:
                  (p0) => Validator.validateConfirmPassword(
                    p0,
                    cubit.passwordController.text,
                  ),
              controller: cubit.confirmPasswordController,
            ),
            verticalSpace(121),
            CustomBtn(
              onPress: () {
                if (cubit.emailKey.currentState!.validate() &&
                    cubit.passwordKey.currentState!.validate()) {
                  cubit.signUp(
                    cubit.emailController.text,
                    cubit.passwordController.text,
                    AppConstants.defaultImage,
                  );
                }
              },
              label: 'Create an account',
              color:
                  state is SignUpLoading
                      ? ColorManager.loading
                      : ColorManager.primary,
              textColor:
                  state is SignUpLoading
                      ? ColorManager.grey
                      : ColorManager.white,
            ),
          ],
        );
      },
    );
  }
}
