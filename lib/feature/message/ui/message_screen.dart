import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/feature/message/ui/widgets/home_app_bar.dart';
import 'package:chat_box/feature/message/ui/widgets/story_list_view.dart';
import 'package:chat_box/feature/message/ui/widgets/user_list_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              verticalSpace(17),
              HomeAppBar(),
              verticalSpace(40),
              StoryListView(),
              verticalSpace(30),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 555 - 90.h,
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
          child: Column(
            children: [
              verticalSpace(13),
              Container(
                width: 30.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: ColorManager.greyLight2,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              verticalSpace(24),
              UserListView(),
            ],
          ),
        ),
      ),
    );
  }
}
