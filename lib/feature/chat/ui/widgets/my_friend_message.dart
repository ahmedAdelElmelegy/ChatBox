import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/data/models/message_model.dart';
import 'package:chat_box/data/models/user_model.dart';
import 'package:chat_box/feature/message/ui/widgets/user_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MyFriendMessage extends StatelessWidget {
  final MessageModel msg;
  final UserModel userModel;
  const MyFriendMessage({
    super.key,
    required this.msg,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            UserPicture(image: userModel.image),
            horizontalSpace(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userModel.name, style: TextSTyles.f14CarosMeduimBlack),
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
                        msg.content,
                        style: TextSTyles.f12CirStdMediumGrey,
                      ),
                    ),
                    verticalSpace(8),
                  ],
                ),
                Text(
                  DateFormat('hh:mm a').format(msg.timestamp),
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
