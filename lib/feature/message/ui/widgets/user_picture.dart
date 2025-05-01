import 'package:chat_box/core/utils/app_constants.dart';
import 'package:chat_box/core/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserPicture extends StatelessWidget {
  final String? image;
  const UserPicture({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.r,
      height: 44.r,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: CachedImage(
        image: image ?? AppConstants.userInfoPicture,
        boxFit: BoxFit.cover,
      ),
      // child: CachedImage(
      //   image: AppConstants.userInfoPicture,
      //   boxFit: BoxFit.cover,
      // ),
    );
  }
}
