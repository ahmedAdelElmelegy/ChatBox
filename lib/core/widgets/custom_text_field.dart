import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Key? fromKey;
  final bool? obscureText;
  final TextStyle? textStyle;
  const CustomTextField({
    super.key,
    required this.text,
    this.controller,
    this.validator,
    this.fromKey,
    this.obscureText,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: textStyle ?? TextSTyles.f14CirStdMediumPrimary),

          TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscureText ?? false,

            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorManager.lightDark),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorManager.primary),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorManager.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
