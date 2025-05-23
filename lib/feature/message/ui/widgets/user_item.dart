import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/widgets/cached_image.dart';
import 'package:chat_box/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserItem extends StatelessWidget {
  final UserModel userModel;
  const UserItem({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 52.r,
                height: 52.r,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CachedImage(image: userModel.image),
              ),
              horizontalSpace(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userModel.name, style: TextSTyles.f20CarosMediumblack),
                  verticalSpace(6),
                  Text(
                    'How are you today?',
                    style: TextSTyles.f12CirStdMediumGrey,
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text('2 min ago', style: TextSTyles.f12CirStdMediumGrey),
              verticalSpace(7),
              CircleAvatar(
                backgroundColor: ColorManager.red,
                radius: 11.r,
                child: Text('3', style: TextSTyles.f12CirStdMediumWhite),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
