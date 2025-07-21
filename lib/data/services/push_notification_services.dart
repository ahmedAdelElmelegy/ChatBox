import 'dart:developer';
import 'package:chat_box/data/services/local_notification_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationServices {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static Future initNotification() async {
    await messaging.requestPermission(); //take permition
    String? token = await messaging.getToken();
    log("token is ${token ?? 'null'}");
    FirebaseMessaging.onBackgroundMessage(handlebackgroundMessage);
    //  second and kill
    // first background

    //  forground
    FirebaseMessaging.onMessage.listen((message) {
      // show local notification
      LocalNotificationServices.showBasicNotification(message);
      log(message.notification?.title ?? 'null');
    });
  }

  static Future<void> handlebackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? 'null');
  }

  // problem in froground
  // 2 kill

  // 3 status
  // 1. forground
  // 2. baground
  // 3. kill
}
