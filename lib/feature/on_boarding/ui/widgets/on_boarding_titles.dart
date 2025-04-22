import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:flutter/material.dart';

class OnBoardingHeaders extends StatelessWidget {
  const OnBoardingHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Text('Connect friends', style: TextSTyles.f68CarosMeduimWhite),
            Text('easily & quickly', style: TextSTyles.f68CarosboldWhite),
          ],
        ),
        verticalSpace(17),
        Text(
          'Our chat app is the perfect way to stay connected with friends and family.',
          style: TextSTyles.f16CirStdMediumGreyDark,
        ),
      ],
    );
  }
}
