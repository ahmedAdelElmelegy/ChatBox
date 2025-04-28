import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/widgets/min_divider.dart';
import 'package:chat_box/feature/message/ui/widgets/search_icon.dart';
import 'package:chat_box/feature/message/ui/widgets/user_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,

      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BorderIcon(),
            Text('Contacts', style: TextSTyles.f20CarosboldWhite),
            BorderIcon(icon: Assets.addUser),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 677 - 90.h,
        width: double.infinity,
        // color: ColorManager.white,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(13),
                MinDivider(),
                verticalSpace(24),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'My Contacts',
                    style: TextSTyles.f16CarosMediumBlack,
                  ),
                ),
                verticalSpace(20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('A', style: TextSTyles.f16CarosBoldBlack),
                ),
                verticalSpace(20),
                UserInFoItem(),
                UserInFoItem(),

                UserInFoItem(),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('B', style: TextSTyles.f16CarosBoldBlack),
                ),
                verticalSpace(20),
                UserInFoItem(),
                UserInFoItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserInFoItem extends StatelessWidget {
  const UserInFoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),

      child: Row(
        children: [
          UserPicture(),
          horizontalSpace(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Jhon Abraham', style: TextSTyles.f18CarosBoldBlack),
              verticalSpace(6),
              Text(
                'Life is beautiful 👌',
                style: TextSTyles.f12CirStdMediumGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
