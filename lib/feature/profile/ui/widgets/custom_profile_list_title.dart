import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:flutter/material.dart';

class CustomProfileListTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomProfileListTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextSTyles.f14CirStdMediumGrey),
        verticalSpace(10),
        Text(
          subtitle,
          style: TextSTyles.f18CarosBoldBlack,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
