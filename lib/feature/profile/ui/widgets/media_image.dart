import 'package:chat_box/core/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaImage extends StatelessWidget {
  const MediaImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.h,
      width: 92.w,
      margin: EdgeInsets.only(right: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: AssetImage(Assets.media),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
