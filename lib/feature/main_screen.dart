import 'package:chat_box/core/helpers/constants.dart';
import 'package:chat_box/core/helpers/spacing.dart';
import 'package:chat_box/core/theme/styles.dart';
import 'package:chat_box/core/widgets/svg_icon.dart';
import 'package:chat_box/feature/calls/ui/calls_screen.dart';
import 'package:chat_box/feature/contacts/ui/contacts_screen.dart';
import 'package:chat_box/feature/message/ui/message_screen.dart';
import 'package:chat_box/feature/settings/ui/settings_screen.dart';
import 'package:chat_box/notifications/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static List<Widget> pages = [
    MessageScreen(),
    CallsScreen(),
    ContactsScreen(),
    SettingsScreen(),
  ];
  int currentIndex = 0;
  void onItemTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    NotificationServices.firebaseInit(context);
    NotificationServices.setupInteractedMessage(context);
    onItemTap(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 90.h,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            onIconSelected(
              () => onItemTap(0),
              0,
              currentIndex == 0,
              Assets.message,

              Assets.iconsMessageActive,
              'Message',
            ),
            onIconSelected(
              () => onItemTap(1),
              1,
              currentIndex == 1,
              Assets.iconsCall,
              Assets.iconsCallActive,
              'Calls',
            ),
            onIconSelected(
              () => onItemTap(2),

              2,
              currentIndex == 2,
              Assets.iconsUser,
              Assets.iconsUserActive,
              'Contacts',
            ),
            onIconSelected(
              () => onItemTap(3),
              3,
              currentIndex == 3,
              Assets.iconsSettings,
              Assets.iconsSettingActive,
              'Settings',
            ),
          ],
        ),
      ),
    );
  }

  Widget onIconSelected(
    VoidCallback onTap,
    int index,
    bool isActive,
    String icon,
    String activeIcon,
    String text,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgIcon(icon: isActive ? activeIcon : icon),
          verticalSpace(2),
          Text(
            text,
            style:
                isActive
                    ? TextSTyles.f14CirStdMediumPrimary
                    : TextSTyles.f14CirStdMediumGrey,
          ),
        ],
      ),
    );
  }
}
