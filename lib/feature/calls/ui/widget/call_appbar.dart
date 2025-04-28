import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/feature/message/ui/widgets/search_icon.dart';
import 'package:flutter/material.dart';

class CallAppBar extends StatelessWidget {
  const CallAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BorderIcon(),
        Text('Calls', style: TextSTyles.f20CarosboldWhite),
        BorderIcon(icon: Assets.iconsCall),
      ],
    );
  }
}
