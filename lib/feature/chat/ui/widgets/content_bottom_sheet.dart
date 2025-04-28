import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/helpers/extentions.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/widgets/svg_icon.dart';
import 'package:chat_box/feature/chat/ui/widgets/content_list_view.dart'
    show ContentListView;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentBottomSheet extends StatelessWidget {
  const ContentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
          color: ColorManager.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => pop(),
                      child: SvgIcon(icon: Assets.remove),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Share Content',
                      style: TextSTyles.f16CarosMediumBlack,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              verticalSpace(20),
              ContentListView(),
            ],
          ),
        ),
      ),
    );
  }
}
