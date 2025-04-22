import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ORWidget extends StatelessWidget {
  const ORWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: .3.h,
          color: ColorManager.secondaryLight,
          width: 132.w,
        ),
        horizontalSpace(15),
        Text(
          'OR',
          style: TextSTyles.f14CirStdMediumGrey.copyWith(
            color: ColorManager.secondaryLight,
          ),
        ),
        horizontalSpace(15),
        Container(
          height: .3.h,

          color: ColorManager.secondaryLight,
          width: 132.w,
        ),
      ],
    );
  }
}
