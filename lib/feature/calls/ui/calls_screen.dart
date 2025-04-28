import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/widgets/min_divider.dart';

import 'package:chat_box/feature/calls/ui/widget/call_appbar.dart';

import 'package:chat_box/feature/calls/ui/widget/call_list_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: CallAppBar(),
        ),
      ),
      bottomSheet: Container(
        height: 677.h - 90.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(13),
              MinDivider(),
              verticalSpace(24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Recent', style: TextSTyles.f16CarosRegularBlack),
              ),
              verticalSpace(20),
              CallListView(),
            ],
          ),
        ),
      ),
    );
  }
}
