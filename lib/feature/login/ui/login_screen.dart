import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/widgets/auth_headers.dart';
import 'package:chat_box/feature/login/ui/login_form.dart';
import 'package:chat_box/feature/on_boarding/ui/widgets/or_widget.dart';
import 'package:chat_box/feature/on_boarding/ui/widgets/social_icon_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                title: 'Log In to Chatbox',
                subtitle:
                    'Welcome back! Sign in using your social account or email to continue us',
              ),
              verticalSpace(30),
              SocialIconSection(
                backgroundColor: ColorManager.white,
                iconColor: ColorManager.black,
                strokeColor: ColorManager.black,
              ),
              verticalSpace(30),
              ORWidget(
                textColor: ColorManager.grey,
                dividerColor: ColorManager.lightDark,
              ),
              verticalSpace(30),
              LoginForm(),
              verticalSpace(16),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Forgot password?',
                  style: TextSTyles.f14CirStdMediumPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
