import 'package:chat_box/core/helpers/extentions.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/widgets/custom_btn.dart';
import 'package:chat_box/core/widgets/custom_text_field.dart';
import 'package:chat_box/feature/main_screen.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(text: 'Your email'),
        verticalSpace(30),
        CustomTextField(text: 'Password', obscureText: true),
        verticalSpace(177),
        CustomBtn(
          onPress: () {
            pushAndRemoveUntil(MainScreen());
          },

          // grey light loading
          label: 'Log in',
        ),
      ],
    );
  }
}
