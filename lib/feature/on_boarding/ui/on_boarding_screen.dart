import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/widgets/svg_icon.dart';
import 'package:chat_box/feature/on_boarding/ui/widgets/on_boarding_titles.dart';
import 'package:chat_box/feature/on_boarding/ui/widgets/or_widget.dart';
import 'package:chat_box/feature/on_boarding/ui/widgets/social_icon_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBaground),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              verticalSpace(61),
              SvgIcon(icon: Assets.iconsLogo),
              verticalSpace(43),
              OnBoardingTitles(),
              verticalSpace(38),
              SocialIconSection(),
              verticalSpace(30),
              ORWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
