import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/utils/app_constants.dart';
import 'package:chat_box/core/widgets/cached_image.dart' show CachedImage;
import 'package:chat_box/feature/message/ui/widgets/search_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearchIcon(),
        Text('Home', style: TextSTyles.f20CarosMediumWhite),
        Container(
          width: 44.r,
          height: 44.r,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: CachedImage(image: AppConstants.userInfoPicture),
        ),
      ],
    );
  }
}
