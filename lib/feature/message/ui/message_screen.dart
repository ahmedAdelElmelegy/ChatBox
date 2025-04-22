import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/utils/app_constants.dart';
import 'package:chat_box/core/widgets/cached_image.dart';
import 'package:chat_box/feature/message/ui/widgets/home_app_bar.dart';
import 'package:chat_box/feature/message/ui/widgets/search_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(children: [verticalSpace(17), HomeAppBar()]),
        ),
      ),
    );
  }
}
