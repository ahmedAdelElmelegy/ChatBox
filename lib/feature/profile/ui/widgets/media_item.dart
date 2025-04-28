import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/feature/profile/ui/widgets/media_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaItem extends StatelessWidget {
  const MediaItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Media Shared', style: TextSTyles.f14CirStdMediumGrey),
            Text('View All', style: TextSTyles.f14CirStdMediumPrimary),
          ],
        ),
        verticalSpace(20),
        SizedBox(
          height: 92.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => MediaImage(),
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
