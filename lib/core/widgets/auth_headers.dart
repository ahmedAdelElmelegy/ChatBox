import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/widgets/login_height_light_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthHeaders extends StatelessWidget {
  final String title;
  final String subtitle;
  const AuthHeaders({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginHighlightText(title: title),
        verticalSpace(16),
        SizedBox(
          width: 293.w,
          child: Text(
            subtitle,
            style: TextSTyles.f14CirStdMediumGrey,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
