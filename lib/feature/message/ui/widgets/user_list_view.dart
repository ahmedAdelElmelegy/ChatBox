import 'package:chat_box/feature/message/ui/widgets/user_item.dart';
import 'package:flutter/material.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => const UserItem(),
        itemCount: 10,
      ),
    );
  }
}
