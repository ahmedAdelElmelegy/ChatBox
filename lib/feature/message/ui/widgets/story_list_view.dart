import 'dart:io';

import 'package:chat_box/feature/message/ui/widgets/story_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class StoryListView extends StatelessWidget {
  const StoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    File? currentImage;
    return SizedBox(
      height: 83.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsets.only(right: 13.w),
              child: StoryItem(
                onImageSelected: (XFile image) {
                  currentImage = File(image.path);
                },
              ),
            ),
        itemCount: 10,
      ),
    );
  }
}
