import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserPicture extends StatelessWidget {
  const UserPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.r,
      height: 44.r,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Image.asset('assets/images/avatar1.png'),
      // child: CachedImage(
      //   image: AppConstants.userInfoPicture,
      //   boxFit: BoxFit.cover,
      // ),
    );
  }
}
