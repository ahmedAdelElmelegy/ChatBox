import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/widgets/min_divider.dart';
import 'package:chat_box/feature/profile/ui/widgets/custom_profile_list_title.dart';
import 'package:chat_box/feature/profile/ui/widgets/media_item.dart'
    show MediaItem;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBottomSheet extends StatelessWidget {
  const ProfileBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 510.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(13),
              Align(alignment: Alignment.center, child: MinDivider()),
              verticalSpace(24),
              CustomProfileListTitle(
                title: 'Display Name',
                subtitle: 'Jhon Abraham',
              ),
              verticalSpace(30),
              CustomProfileListTitle(
                title: 'Email Address',
                subtitle: 'jhonabraham20@gmail.com',
              ),
              verticalSpace(30),
              CustomProfileListTitle(
                title: 'Address',
                subtitle: '33 street west subidbazar,sylhet',
              ),
              verticalSpace(30),
              CustomProfileListTitle(
                title: 'Phone  Number',
                subtitle: '(320) 555-0104',
              ),
              verticalSpace(30),
              MediaItem(),
            ],
          ),
        ),
      ),
    );
  }
}
