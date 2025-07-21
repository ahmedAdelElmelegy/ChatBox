import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class LocalNotificationServices {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static onTap(NotificationResponse notificationResponse) {}

  static Future<void> init() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );

    // basic notification
  }

  static void showBasicNotification(RemoteMessage message) async {
    final http.Response image = await http.get(
      Uri.parse(message.notification?.android?.imageUrl ?? ''),
    );

    BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
          ByteArrayAndroidBitmap.fromBase64String(
            base64Encode(image.bodyBytes),
          ),
          largeIcon: ByteArrayAndroidBitmap.fromBase64String(
            base64Encode(image.bodyBytes),
          ),
        );
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
        priority: Priority.high,
        styleInformation: bigPictureStyleInformation,
      ),
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? 'null',
      message.notification?.body ?? 'null',
      notificationDetails,
    );
  }

  // static void showRepetedNotification() async {
  //   NotificationDetails notificationDetails = NotificationDetails(
  //     android: AndroidNotificationDetails(
  //       'channel id',
  //       'channel name',

  //       channelDescription: 'channel description',
  //       importance: Importance.max,
  //       priority: Priority.high,
  //     ),
  //   );
  //   await flutterLocalNotificationsPlugin.periodicallyShow(
  //     1,

  //     'Repeted Notification',
  //     'body',
  //     RepeatInterval.everyMinute,
  //     notificationDetails,
  //     payload: 'Repeted Notification',
  //     androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  //   );
  // }

  // static void cancelNotification(int id) async {
  //   await flutterLocalNotificationsPlugin.cancel(id);
  // }
}
// setup
// basic notification
// repeted notification
// schedule notification