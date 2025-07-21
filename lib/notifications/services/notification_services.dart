import 'dart:io';
import 'package:chat_box/feature/message/ui/message_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotificationServices {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User Provisional granted permission');
    } else {
      Fluttertoast.showToast(msg: 'Notification permission denied');
    }
  }

  // gettoken
  static Future<String> getToken() async {
    String token = await messaging.getToken() ?? '';
    print('token: $token');
    return token;
  }

  // local notifications
  static void initLocalNotification(
    BuildContext context,
    RemoteMessage message,
  ) async {
    var androidInitSettings = AndroidInitializationSettings(
      "@mipmap/ic_launcher",
    );

    var iosInitSettings = DarwinInitializationSettings();
    var initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iosInitSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (payload) {
        handleMessage(context, message);
      },
    );
  }

  static void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (kDebugMode) {
        print('notification title ${notification!.title}');
        print('notification title ${notification.body}');
      }
      if (Platform.isIOS) {
        iosForegroundNotification();
      }
      // android
      if (Platform.isAndroid) {
        initLocalNotification(context, message);
        showNotifications(message);
        // handleMessage(context, message);
      }
    });
  }

  // function  to show notifications
  static Future<void> showNotifications(RemoteMessage message) async {
    // channel settings
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      'default_channel',
      'Default Notifications',
      importance: Importance.high,
      showBadge: true,
      playSound: true,
    );
    // android settings
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: "Channel description",
          importance: Importance.high,

          priority: Priority.high,
          playSound: true,
          sound: channel.sound,
        );

    // ios settings
    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        );
    // merge settings
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
    // show notifications
    Future.delayed(Duration.zero, () async {
      await flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: 'my_data',
      );
    });
  }

  // baground  and terminators
  // open message
  static Future<void> setupInteractedMessage(BuildContext context) async {
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
    FirebaseMessaging.instance.getInitialMessage().then((
      RemoteMessage? message,
    ) {
      if (message != null && message.data.isNotEmpty) {
        handleMessage(context, message);
      }
    });
  }

  // for enter message
  static Future<void> handleMessage(
    BuildContext context,
    RemoteMessage message,
  ) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MessageScreen()),
    );
  }

  // ios message
  static Future iosForegroundNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
  }
}
