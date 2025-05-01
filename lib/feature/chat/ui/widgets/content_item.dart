import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/data/models/content_model.dart';
import 'package:chat_box/feature/chat/ui/widgets/content_icon.dart';
import 'package:flutter/material.dart';

class ContentItem extends StatelessWidget {
  final ContentModel contentModel;
  const ContentItem({super.key, required this.contentModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ContentIcon(icon: contentModel.icon),
        horizontalSpace(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contentModel.title, style: TextSTyles.f14CarosBoldBlack),
            verticalSpace(6),
            Text(contentModel.subtitle, style: TextSTyles.f12CirStdMediumGrey),
          ],
        ),
      ],
    );
  }
}
