import 'package:chat_box/data/services/cloud_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  late FirebaseMessaging _firebaseMessaging;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    getDeviceToken();
  }

  String deviceToken = '';

  void getDeviceToken() async {
    try {
      _firebaseMessaging = FirebaseMessaging.instance;
      String? token = await _firebaseMessaging.getToken();
      setState(() {
        deviceToken = token ?? '';
      });
      print(deviceToken);
    } catch (err) {
      print('error when get the FCM token: $err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'إختبار الإشعارات - Firebase cloud messaging Api v1',
              textDirection: TextDirection.rtl,
            ),

            ElevatedButton(
              onPressed: () async {
                await PushNotificationService.sendNotificationToAdmin(
                  deviceToken,
                  context,
                  '0',
                  'Hello, there',
                  'We send this notification to test!',
                );
              },
              child: const Text('test'),
            ),
          ],
        ),
      ),
    );
  }
}
