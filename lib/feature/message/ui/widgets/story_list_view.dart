import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/feature/message/ui/widgets/story_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryListView extends StatelessWidget {
  const StoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82.h,
      child: Container(
        color: ColorManager.red,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder:
              (context, index) => Padding(
                padding: EdgeInsets.only(right: 13.w),
                child: const StoryItem(),
              ),
          itemCount: 10,
        ),
      ),
    );
  }
}
