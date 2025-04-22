import 'package:chat_box/feature/splash/ui/splash_screen.dart';
import 'package:chat_box/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),

      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigator,
          title: 'Flutter Demo',
          home: SplashScreen(),
        );
      },
    );
  }
}
