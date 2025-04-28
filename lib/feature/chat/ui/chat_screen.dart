import 'package:chat_box/core/helpers/spacing.dart';

import 'package:chat_box/feature/chat/ui/widgets/chat_appbar.dart';

import 'package:chat_box/feature/chat/ui/widgets/enter_message_widget.dart';
import 'package:chat_box/feature/chat/ui/widgets/my_friend_message.dart';
import 'package:chat_box/feature/chat/ui/widgets/my_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              verticalSpace(16),
              ChatAppBar(),
              Expanded(
                child: ListView.builder(
                  itemBuilder:
                      (context, index) =>
                          index.isEven ? MyMessage() : MyFriendMessage(),

                  itemCount: 10,
                ),
              ),
              EnterMessageWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
