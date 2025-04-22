import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialIcon extends StatelessWidget {
  final String icon;
  final Color? bagroundColor;
  final Color? iconColor;
  final Color? strokeColor;
  const SocialIcon({
    super.key,
    required this.icon,
    this.bagroundColor,
    this.iconColor,
    this.strokeColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24.r,
      backgroundColor: strokeColor ?? ColorManager.white,
      child: CircleAvatar(
        backgroundColor: bagroundColor ?? ColorManager.black,
        radius: 23.r,
        child: SvgIcon(icon: icon, color: iconColor),
      ),
    );
  }
}
