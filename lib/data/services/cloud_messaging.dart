import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class PushNotificationService {
  static Future<String> getAccessToken() async {
    final serviceAcountJson = {
      "type": "service_account",
      "project_id": "e-comm-firebase-9c2e8",
      "private_key_id": "e5cb58b2d2257fbe334a4253b2e06b72e35bf492",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC/7C0jJoomQp+4\nfpEvlyEn9aohwAgK+ADifqh8miEx7iEk0Btsle5SXYsat83dM8chkoLAwD2dlR52\nSWyBSwZYo26YnJzf7S8poksrbBLec0/CG/24lLXUW5HJsSmJRlnCtf7QMR94L8jq\nAyRpcmKL3itCTs3E0//2uoCpo37otYwv5Q0svSoTVq+LSQPbQg64Fv6Zn4pcLuVB\nA1RNQqhWeC/ET5+1nd80bKazOmrDjlZYZuJfqqdBlgnja2ISLcr29jMEbWc7GQKm\ngr2aDkYfba56xJIVGCCeWe07ga6555om1cKD4ZVrcmrlrlK30/Es9S6k7T8xPvQw\n4LXIqiEvAgMBAAECggEAUfS26bXBdMkqj4xsz1fILto3RqZMSPLS3eWcaWkgF8RK\nnv/HVj1IQh/0EPrAjF9Z/7oi39C3/xz4nyaHkUbKdPuFdOIcE3ujkjHdy7Mg86Fm\nQ8vUMwg+BWr8/JYM2LQUDJPPNnRjrd0p/NROrkDMWFINQwmH0S9+tIu7+bT5ssFm\nD9WIg3B03vCWDwNBymukECf+W59RbZ0xUbAta4Qi8KocdunTAPCpmLEbEBbt6Uhp\nax8PA+uWaGrsMvGyhkU20MrwkxFjlSrxCiatSJeG+2qinpOj4/uH+xSS71a45Y22\njxbe3aS6sr8MuRkEyC27f7gF2v5PhBnWavclIwT50QKBgQDxwaZm8HpwvBkMyt0t\nlUE4n+pcOtJD+Ozg2CjihrKg4/Fd5V7RUzlNTKglmxXmxU5VBAYdkeCvWVKbeUJz\nNdN7LgcyhzTq/xk/VjyeRbi31WOl0J7lBTaaBDrP7iactgxzwuWlMppLNxUVnjD4\nhfCOCkDBjYOMBsBaMtdLjXd1NQKBgQDLOuUOZb6YfR24aps2nf0Lew68Wj/Yl3vp\ndASMj+bQ1HMNEEwr5pOHJ2QE+JWF4CbqoURWWUzPa7MnAtTaz1RIYBs1RQ5F6W34\nI55md29DlSlRVsscuBInY9XqpP3DsTZsCBWsnc9BD9mwKrInA2DDz4W91e8eoFHB\njoiZk6u9UwKBgDgD55t4YtZWLvOw2XijWZ5WJ0ZBdtC7D5+1VhvOm/r9dcKMz+Bu\niRtpBJjaC0QSOWknaodVcpsOdj6B5Syurxaefppti4xbmSz8vUTq4LbvoYwc/4QP\nJiyfiET/aEDtSYtVAEK7q9Z7p83/fldHKYqvw3tVX8KFGfKMTyg5WhF1AoGABkH/\n/5t+bO+dVKpjsSDYQ9w8LeyRfrfbZurdoP5lWxTPnh1cWxW0gTrjR4vn/sFSMXNZ\nyVbimJh2YcMijsJHlBrxe4hu0hRIAJYIMJuI34neRdToWDAKzw+x7JG8BqSUSmtN\nT41kblpwl44ZAj6GYkEnmxrVTBofqlgbOK9lYGUCgYEAyg/vNezeZtYqK9V4/x/z\n4A3V1bpO7wFESfZzOq0EjZFv9A+YXyJR5YMZ22u7IPETxA/hYmQSNZt+mQsr5fa5\n6U23iZJ0Qbo9oJuF6Q+NRYMHreE556bnFXlbGy2nzj9krIcFHOGtBuMVDF+8ZfV3\nMgylq+qW5ftfz4h2zG1ZfZQ=\n-----END PRIVATE KEY-----\n",
      "client_email": "chats-576@e-comm-firebase-9c2e8.iam.gserviceaccount.com",
      "client_id": "105779808762032717468",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/chats-576%40e-comm-firebase-9c2e8.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com",
    };
    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];
    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAcountJson),
      scopes,
    );
    // get the access  token
    auth.AccessCredentials credentials = await auth
        .obtainAccessCredentialsViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAcountJson),
          scopes,
          client,
        );
    client.close();
    return credentials.accessToken.data;
  }

  static sendNotificationToAdmin(
    String deviceToken,
    BuildContext context,
    String tripId,
    String messageSender,
    String messageBody,
  ) async {
    final String serverAccessTokenKey = await getAccessToken();
    String endPointFirebaseCloudMessaging =
        'https://fcm.googleapis.com/v1/projects/e-comm-firebase-9c2e8/messages:send';

    final Map<String, dynamic> message = {
      'message': {
        'token': deviceToken,
        'notification': {'title': messageSender, 'body': messageBody},
        'data': {'tripId': tripId},
      },
    };

    final http.Response response = await http.post(
      Uri.parse(endPointFirebaseCloudMessaging),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverAccessTokenKey',
      },
      body: jsonEncode(message),
    );
    if (response.statusCode == 200) {
      print('Notification send successfully');
    } else {
      print('Send notification faild: ${response.statusCode}');
    }
  }
}
