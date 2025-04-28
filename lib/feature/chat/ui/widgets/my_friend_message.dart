import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/feature/message/ui/widgets/user_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFriendMessage extends StatelessWidget {
  const MyFriendMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            UserPicture(),
            horizontalSpace(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jhon Abraham', style: TextSTyles.f14CarosMeduimBlack),
                    verticalSpace(12),
                    Container(
                      margin: EdgeInsets.only(left: 8.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: ColorManager.greyLight3,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.r),
                          // topLeft: Radius.circular(16.r),
                          bottomLeft: Radius.circular(16.r),
                          bottomRight: Radius.circular(16.r),
                        ),
                      ),
                      child: Text(
                        'Hello! Jhon abraham......',
                        style: TextSTyles.f12CirStdMediumGrey,
                      ),
                    ),
                    verticalSpace(8),
                  ],
                ),
                Text(
                  '09:25 AM',
                  style: TextSTyles.f10CirStdMediumWhite,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
