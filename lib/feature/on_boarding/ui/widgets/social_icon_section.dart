import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/widgets/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialIconSection extends StatelessWidget {
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? strokeColor;
  const SocialIconSection({
    super.key,
    this.backgroundColor,
    this.iconColor,
    this.strokeColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialIcon(
            icon: Assets.iconsFacebook,
            strokeColor: strokeColor,
            bagroundColor: backgroundColor,
          ),
          horizontalSpace(20),
          SocialIcon(
            icon: Assets.iconsGoogle,
            strokeColor: strokeColor,
            bagroundColor: backgroundColor,
          ),
          horizontalSpace(20),
          SocialIcon(
            strokeColor: strokeColor,
            icon: Assets.iconsApple,
            iconColor: iconColor,
            bagroundColor: backgroundColor,
          ),
        ],
      ),
    );
  }
}
