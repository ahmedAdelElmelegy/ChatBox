import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/helpers/extentions.dart';
import 'package:chat_box/data/models/content_model.dart';
import 'package:chat_box/feature/profile/ui/profile_screen.dart';
import 'package:chat_box/feature/settings/ui/widgets/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingListView extends StatelessWidget {
  const SettingListView({super.key});
  static List<ContentModel> contentItem = [
    ContentModel(
      onPress: () {
        push(ProfileScreen());
      },
      title: 'Account',
      subtitle: 'Privacy, security, change number',
      icon: Assets.key,
    ),
    ContentModel(
      onPress: () {
        push(ProfileScreen());
      },
      title: 'Chat',
      subtitle: 'Chat history,theme,wallpapers',
      icon: Assets.message,
    ),
    ContentModel(
      onPress: () {
        push(ProfileScreen());
      },
      title: 'Notifications',
      subtitle: 'Messages, group and others',
      icon: Assets.notification,
    ),
    ContentModel(
      onPress: () {
        push(ProfileScreen());
      },
      title: 'Help',
      subtitle: 'Help center,contact us, privacy policy',
      icon: Assets.help,
    ),
    ContentModel(
      onPress: () {
        push(ProfileScreen());
      },
      title: 'Storage and data',
      subtitle: 'Network usage, stogare usage',
      icon: Assets.data,
    ),
    ContentModel(
      onPress: () {
        push(ProfileScreen());
      },

      title: 'Invite a friend',
      subtitle: '',
      icon: Assets.users,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: contentItem.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => contentItem[index].onPress!(),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: SettingItem(contentModel: contentItem[index]),
            ),
          );
        },
      ),
    );
  }
}
