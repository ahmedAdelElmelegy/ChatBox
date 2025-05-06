import 'dart:async';

import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/helpers/extentions.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/widgets/svg_icon.dart';
import 'package:chat_box/data/manager/send_message/send_message_cubit.dart';
import 'package:chat_box/data/models/user_model.dart';
import 'package:chat_box/feature/chat/ui/widgets/chat_text_field.dart';
import 'package:chat_box/feature/chat/ui/widgets/content_bottom_sheet.dart';
import 'package:chat_box/feature/chat/ui/widgets/voice_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class EnterMessageWidget extends StatefulWidget {
  final UserModel userModel;
  final Function()? scrollToBottom;
  const EnterMessageWidget({
    super.key,
    required this.userModel,
    this.scrollToBottom,
  });

  @override
  State<EnterMessageWidget> createState() => _EnterMessageWidgetState();
}

class _EnterMessageWidgetState extends State<EnterMessageWidget> {
  String text = '';
  Timer? _debounceTimer;
  XFile? selectedImage;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messageCubit = SendMessageCubit.get(context);
    // final cubit = GetChatCubit.get(context);
    final user = FirebaseAuth.instance;
    return SizedBox(
      height: 90.h,
      child: Padding(
        padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => ContentBottomSheet(),
                );
              },
              child: SvgIcon(icon: Assets.iconsAllFile),
            ),
            horizontalSpace(11),
            ChatTextField(
              controller: messageCubit.textController,
              onChanged: (p0) {
                setState(() {
                  text = p0;
                  // cubit.setTyping(
                  //   _getChatId(user.currentUser!.uid, widget.userModel.uid),
                  //   user.currentUser!.uid,
                  //   true,
                  // );
                  // _debounceTimer?.cancel();
                  // _debounceTimer = Timer(const Duration(seconds: 1), () {});
                });
              },
            ),
            horizontalSpace(16),
            onTextWrite(() {
              if (messageCubit.textController.text.isNotEmpty ||
                  messageCubit.images.isNotEmpty ||
                  messageCubit.pdfUrl.isNotEmpty) {
                messageCubit.sendMessage(
                  receiverId: widget.userModel.uid,
                  senderId: user.currentUser!.uid,
                );
                widget.scrollToBottom!();

                setState(() {});
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget onTextWrite(void Function()? onTap) {
    if (text.isNotEmpty && text != '' ||
        context.watch<SendMessageCubit>().images.isNotEmpty ||
        context.watch<SendMessageCubit>().pdfUrl.isNotEmpty) {
      return GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: ColorManager.primary,
          radius: 20.r,
          child: SvgIcon(icon: Assets.iconsSend),
        ),
      );
    } else {
      return Row(
        children: [
          SvgIcon(icon: Assets.iconsCamera),
          horizontalSpace(12),
          GestureDetector(
            onTap: () {
              push(VoiceMessageScreen());
            },
            child: SvgIcon(icon: Assets.iconsMicrophone),
          ),
        ],
      );
    }
  }

  // String _getChatId(String user1, String user2) {
  //   final sorted = [user1, user2]..sort();
  //   return '${sorted[0]}_${sorted[1]}';
  // }
}
