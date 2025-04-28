import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/widgets/svg_icon.dart';
import 'package:chat_box/feature/chat/ui/widgets/chat_text_field.dart';
import 'package:chat_box/feature/chat/ui/widgets/content_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterMessageWidget extends StatefulWidget {
  const EnterMessageWidget({super.key});

  @override
  State<EnterMessageWidget> createState() => _EnterMessageWidgetState();
}

class _EnterMessageWidgetState extends State<EnterMessageWidget> {
  String text = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: Padding(
        padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => ContentBottomSheet(),
                );
              },
              child: SvgIcon(icon: Assets.iconsAllFile),
            ),
            horizontalSpace(11),
            ChatTextField(
              onChanged: (p0) {
                setState(() {
                  text = p0;
                });
              },
            ),
            horizontalSpace(16),
            onTextWrite(),
          ],
        ),
      ),
    );
  }

  Widget onTextWrite() {
    if (text.isNotEmpty) {
      return CircleAvatar(
        backgroundColor: ColorManager.primary,
        radius: 20.r,
        child: SvgIcon(icon: Assets.iconsSend),
      );
    } else {
      return Row(
        children: [
          SvgIcon(icon: Assets.iconsCamera),
          horizontalSpace(12),
          SvgIcon(icon: Assets.iconsMicrophone),
        ],
      );
    }
  }
}
