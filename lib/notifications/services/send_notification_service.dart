import 'dart:convert';

import 'package:chat_box/notifications/services/get_services_key.dart';
import 'package:http/http.dart' as http;

class SendNotificationService {
  Future<void> sendNotificationUsingApi({
    required String token,
    required String body,
    required String title,
    required Map<String, dynamic> data,
  }) async {
    String serverKey = await GetServicesKey.getServerKeyToken();
    String baseUrl =
        'https://fcm.googleapis.com/v1/projects/e-comm-firebase-9c2e8/messages:send';
    var headers = {
      'Authorization': 'Bearer $serverKey',
      'Content-Type': 'application/json',
    };
    // body
    Map<String, dynamic> message = {
      "message": {
        "token": token,
        "notification": {"title": title, "body": body},
        "data": data,
      },
    }; // hint api

    http.Response response = await http.post(
      Uri.parse(baseUrl),
      headers: headers,
      body: jsonEncode(message),
    );
    if (response.statusCode == 200) {
      print('notification sent');
    } else {
      print('notification not sent');
    }
  }
}
