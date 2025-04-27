import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingHeaders extends StatelessWidget {
  const OnBoardingHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: 312.h,
              child: AutoSizeText(
                'Connect friends easily & quickly',
                style: TextSTyles.f68CarosMeduimWhite,
                textAlign: TextAlign.center,

                maxFontSize: 20.sp,
              ),
            ),
          ],
        ),
        verticalSpace(17),
        FittedBox(
          child: Text(
            'Our chat app is the perfect way to stay connected with friends and family.',
            style: TextSTyles.f16CirStdMediumGreyDark,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
