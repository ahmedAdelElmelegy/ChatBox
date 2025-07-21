import 'package:chat_box/core/di/injection.dart';
import 'package:chat_box/data/services/push_notification_services.dart';
import 'package:chat_box/firebase_options.dart';
import 'package:chat_box/my_app.dart';
import 'package:chat_box/notifications/services/fcm_services.dart';
import 'package:chat_box/notifications/services/notification_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  NotificationServices.requestNotificationPermission();
  NotificationServices.getToken();
  FcmServices.firebaseInit();

  init();
  // await Future.wait([
  //   // LocalNotificationServices.init(),
  //   PushNotificationServices.initNotification(),
  // ]);

  runApp(MyApp());
}
