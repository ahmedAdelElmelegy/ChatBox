import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBtn extends StatelessWidget {
  final Function()? onPress;
  final String label;
  final Color? color;
  final Color? textColor;
  const CustomBtn({
    super.key,
    this.onPress,
    required this.label,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        minimumSize: Size(double.infinity, 48.h),
      ),
      onPressed: onPress,
      child: Text(
        label,
        style: TextSTyles.f16CarosMediumBlack.copyWith(
          color: textColor ?? ColorManager.white,
        ),
      ),
    );
  }
}
