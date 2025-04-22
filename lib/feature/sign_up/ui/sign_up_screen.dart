import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/widgets/auth_headers.dart';
import 'package:chat_box/core/widgets/custom_btn.dart';
import 'package:chat_box/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              AuthHeaders(
                title: 'Sign up with Email',
                subtitle:
                    'Get chatting with friends and family today by signing up for our chat app!',
              ),
              verticalSpace(60),
              CustomTextField(text: 'Your name'),
              verticalSpace(30),
              CustomTextField(text: 'Your email'),
              verticalSpace(30),

              CustomTextField(text: 'Password', obscureText: true),
              verticalSpace(30),
              CustomTextField(text: 'Confirm password', obscureText: true),
              verticalSpace(121),
              CustomBtn(onPress: () {}, label: 'Create an account'),
            ],
          ),
        ),
      ),
    );
  }
}
