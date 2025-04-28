import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/widgets/svg_icon.dart' show SvgIcon;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderIcon extends StatelessWidget {
  final String? icon;
  const BorderIcon({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(color: ColorManager.white, width: .1.sp),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgIcon(
          icon: icon ?? Assets.iconsSearch,
          width: 22.w,
          height: 22.h,
        ),
      ),
    );
  }
}
