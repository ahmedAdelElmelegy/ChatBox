import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/helpers/extentions.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';

import 'package:chat_box/core/widgets/svg_icon.dart';
import 'package:chat_box/feature/chat/ui/widgets/content_icon.dart';

import 'package:chat_box/feature/profile/ui/widgets/profile_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => pop(),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SvgIcon(icon: Assets.back),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 41.r,
                      backgroundImage: AssetImage('assets/images/avatar1.png'),
                    ),
                    verticalSpace(12),
                    Text('Alex Linderson', style: TextSTyles.f20CarosboldWhite),
                    verticalSpace(8),
                    Text('@jhonabraham', style: TextSTyles.f12CirStdMediumGrey),
                  ],
                ),
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ContentIcon(
                      icon: Assets.message,
                      color: ColorManager.dark,
                      iconColor: ColorManager.white,
                    ),
                    ContentIcon(
                      icon: Assets.iconsVideo,
                      color: ColorManager.dark,
                      iconColor: ColorManager.white,
                    ),
                    ContentIcon(
                      icon: Assets.iconsCall,
                      color: ColorManager.dark,
                      iconColor: ColorManager.white,
                    ),
                    ContentIcon(
                      icon: Assets.iconsMore,
                      color: ColorManager.dark,
                      iconColor: ColorManager.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: ProfileBottomSheet(),
    );
  }
}
