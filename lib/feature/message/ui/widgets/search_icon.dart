import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/widgets/svg_icon.dart' show SvgIcon;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22.r,
      backgroundColor: ColorManager.white,
      child: CircleAvatar(
        radius: 21.r,
        backgroundColor: ColorManager.black,
        child: SvgIcon(icon: Assets.iconsSearch, width: 22.w, height: 22.h),
      ),
    );
  }
}
