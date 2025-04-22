import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHighlightText extends StatelessWidget {
  final String title;
  const LoginHighlightText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 1.h,
          left: 0,
          child: Container(
            width: 56.w,
            height: 8.h,
            color: ColorManager.highlight,
          ),
        ),

        Text(title, style: TextSTyles.f18CarosBoldBlack),
      ],
    );
  }
}
