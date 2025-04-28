import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/widgets/svg_icon.dart';
import 'package:chat_box/feature/message/ui/widgets/user_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CallItem extends StatelessWidget {
  const CallItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserPicture(),
        horizontalSpace(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Jhon Abraham', style: TextSTyles.f18CarosBoldBlack),

            Row(
              children: [
                SvgIcon(icon: Assets.call2, width: 16.w, height: 16.h),
                horizontalSpace(2),
                Text('Today, 09:30 AM', style: TextSTyles.f12CirStdMediumGrey),
              ],
            ),
          ],
        ),
        Spacer(),
        SvgIcon(icon: Assets.iconsCall),
        horizontalSpace(16),
        SvgIcon(icon: Assets.iconsVideo, color: Color(0xff989E9C)),
      ],
    );
  }
}
