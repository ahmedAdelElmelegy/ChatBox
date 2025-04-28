import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final Color? iconColor;
  const ContentIcon({
    super.key,
    required this.icon,
    this.color,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22.r,
      backgroundColor: color ?? ColorManager.greyLight3,
      child: SvgIcon(icon: icon, color: iconColor),
    );
  }
}
