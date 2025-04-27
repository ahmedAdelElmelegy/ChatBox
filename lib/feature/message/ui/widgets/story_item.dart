import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/utils/app_constants.dart';
import 'package:chat_box/core/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            SizedBox(
              width: 58.w,
              height: 58.h,
              child: CircleAvatar(
                radius: 29.r,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(Assets.myStoryBag),
                child: CircleAvatar(
                  radius: 28.r,
                  backgroundColor: ColorManager.black,

                  child: Container(
                    width: 52.r,
                    height: 52.r,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: CachedImage(
                      image: AppConstants.userInfoPicture,
                      boxFit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            CircleAvatar(
              radius: 8.r,
              backgroundColor: ColorManager.white,
              child: Icon(Icons.add, size: 10.sp, color: ColorManager.black),
            ),
          ],
        ),

        verticalSpace(10),
        Text('My status', style: TextSTyles.f14CarosRegularwhite),
      ],
    );
  }
}
