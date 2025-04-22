import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/helpers/extentions.dart';
import 'package:chat_box/feature/on_boarding/ui/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      pushAndRemoveUntil(const OnBoardingScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(Assets.splashLogo, width: 156.w, height: 123.h),
      ),
    );
  }
}
