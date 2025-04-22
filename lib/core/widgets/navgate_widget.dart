import 'package:chat_box/core/theme/styles.dart';
import 'package:flutter/material.dart';

class NavgateWidget extends StatelessWidget {
  final String text;
  final Function()? onPress;
  final String label;
  const NavgateWidget({
    super.key,
    required this.text,
    this.onPress,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: TextSTyles.f14CirStdMediumGreyDark),
        TextButton(
          onPressed: onPress,
          child: Text(text, style: TextSTyles.f14CirStdMediumWhite),
        ),
      ],
    );
  }
}
