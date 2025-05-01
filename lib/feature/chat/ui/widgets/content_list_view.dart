import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/theme/colors.dart';
import 'package:chat_box/data/models/content_model.dart';
import 'package:chat_box/feature/chat/ui/widgets/content_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentListView extends StatelessWidget {
  const ContentListView({super.key});
  static List<ContentModel> contentItem = [
    ContentModel(title: 'Camera', subtitle: '', icon: Assets.iconsCamera),
    ContentModel(
      title: 'Documents',
      subtitle: 'Share your files',
      icon: Assets.iconsDoc,
    ),
    ContentModel(
      title: 'Media',
      subtitle: 'Share photos and videos',
      icon: Assets.iconsMedia,
    ),
    ContentModel(
      title: 'Contact',
      subtitle: 'Share your contacts',
      icon: Assets.iconsUser,
    ),
    ContentModel(
      title: 'Location',
      subtitle: 'Share your location',
      icon: Assets.iconsLocation,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder:
          (context, index) =>
              Divider(thickness: 1.h, color: ColorManager.greylight),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder:
          (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: ContentItem(contentModel: contentItem[index]),
          ),
      itemCount: contentItem.length,
    );
  }
}
