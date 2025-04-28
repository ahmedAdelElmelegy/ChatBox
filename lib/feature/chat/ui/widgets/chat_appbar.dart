import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/helpers/extentions.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/widgets/svg_icon.dart';
import 'package:chat_box/feature/message/ui/widgets/user_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => pop(),
          child: SvgIcon(icon: Assets.back, width: 24.w, height: 24.h),
        ),
        horizontalSpace(12),
        UserPicture(),
        horizontalSpace(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Jhon Abraham', style: TextSTyles.f16CarosMediumBlack),
            verticalSpace(6),
            Text('Active now', style: TextSTyles.f12CirStdMediumGrey),
          ],
        ),
        Spacer(),
        Row(
          children: [
            SvgIcon(icon: Assets.iconsCall),
            horizontalSpace(16),
            SvgIcon(icon: Assets.iconsVideo),
          ],
        ),
      ],
    );
  }
}
