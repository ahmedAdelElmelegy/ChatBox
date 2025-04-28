import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/widgets/min_divider.dart';
import 'package:chat_box/core/widgets/svg_icon.dart';
import 'package:chat_box/feature/contacts/ui/contacts_screen.dart';
import 'package:chat_box/feature/settings/ui/widgets/setting_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              verticalSpace(19),

              Center(
                child: Text('Settings', style: TextSTyles.f20CarosboldWhite),
              ),
            ],
          ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [UserInFoItem(), SvgIcon(icon: Assets.iconsBarcode)],
              ),
              verticalSpace(20),
              Divider(color: ColorManager.greylight, thickness: 1.h),
              SettingListView(),
            ],
          ),
        ),
      ),
    );
  }
}
