import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialIcon extends StatelessWidget {
  final String icon;
  const SocialIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24.r,
      backgroundColor: ColorManager.white,
      child: CircleAvatar(
        backgroundColor: ColorManager.black,
        radius: 23.r,
        child: SvgIcon(icon: icon),
      ),
    );
  }
}
