import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/widgets/social_icon.dart';
import 'package:flutter/material.dart';

class SocialIconSection extends StatelessWidget {
  const SocialIconSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIcon(icon: Assets.iconsFacebook),
        horizontalSpace(20),
        SocialIcon(icon: Assets.iconsGoogle),
        horizontalSpace(20),
        SocialIcon(icon: Assets.iconsApple),
      ],
    );
  }
}
