import 'package:chat_box/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MinDivider extends StatelessWidget {
  const MinDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 4.h,
      decoration: BoxDecoration(
        color: ColorManager.greyLight2,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
