import 'package:chat_box/core/helpers/extentions.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/feature/chat/ui/chat_screen.dart';
import 'package:chat_box/feature/message/ui/widgets/user_item.dart';
import 'package:flutter/material.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder:
            (context, index) => InkWell(
              splashColor: ColorManager.greylight,
              onTap: () {
                push(const ChatScreen());
              },
              child: const UserItem(),
            ),
        itemCount: 10,
      ),
    );
  }
}
