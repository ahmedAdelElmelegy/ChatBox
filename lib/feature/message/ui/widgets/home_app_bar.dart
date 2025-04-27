import 'package:chat_box/core/theme/styles.dart';

import 'package:chat_box/feature/message/ui/widgets/search_icon.dart';
import 'package:chat_box/feature/message/ui/widgets/user_picture.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearchIcon(),
        Text('Home', style: TextSTyles.f20CarosMediumWhite),
        UserPicture(),
      ],
    );
  }
}
