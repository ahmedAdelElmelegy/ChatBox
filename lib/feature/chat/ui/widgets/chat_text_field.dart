import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ChatTextField extends StatefulWidget {
  final VoidCallback? onSend;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final VoidCallback? onAttachment;

  const ChatTextField({
    super.key,
    this.onSend,
    this.onAttachment,
    this.controller,
    this.onChanged,
  });

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 40.h,
        child: TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: widget.onAttachment,
                child: SvgIcon(icon: Assets.iconsFiles),
              ),
            ),
            hintText: 'Write your message',
            hintStyle: TextSTyles.f12CirStdMediumGrey,
            filled: true,
            fillColor: ColorManager.greylight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
