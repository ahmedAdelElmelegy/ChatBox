import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'notification_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationServices notificationServices = NotificationServices();
  final deviceToken =
      'fzW6z6IyR9ifDLDZxjHDWi:APA91bEXQzlTqYmKnupK6bSTtr2oN1pR9iE7ObMR_Ap-SISBiSxL6wxBd2VyUp0jGL5BK-85JdsxjvphJ2W4ZCffpEuOOmusBlw4kCBo6UZprFX2-p9OjSs';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Notifications')),
      body: Center(
        child: TextButton(
          onPressed: () {
            // send notification from one device to another
          },
          child: Text('Send Notifications'),
        ),
      ),
    );
  }
}
