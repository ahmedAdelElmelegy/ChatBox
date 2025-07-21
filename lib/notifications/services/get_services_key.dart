import 'package:googleapis_auth/auth_io.dart';

class GetServicesKey {
  static Future<String> getServerKeyToken() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];
    final client = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson({
        "type": "service_account",
        "project_id": "e-comm-firebase-9c2e8",
        "private_key_id": "0cb89e747dd3ecd0fa938ea4bce9706a7db28435",
        "private_key":
            "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDZjdZ1o0eJhMyt\nyMP0uOXIlaLIqXz8vHxRlqpX6wA72yzegx5TBaStXxIit4JHLKLjx/BgWEGcyg3k\njpQW+5KdUFTBaNk+09AOrI8dzgSyxOpCy9lRXs2QA5QkbvjG77Bogqw6mF1+d4KN\ndQ0Q9cLAxOAkP4ic8GfTElvqcQDaPpYkX5H9m2Vomsmk+ZDIGo5yYH99XsBaImi+\n0PozTiy/OsCFNkBDZrJsYuc5nPoaueI1Bd0sza+Y64moMgMsYiOIVvxxjYMX99FB\n0XXA2dSskMFaro65FjtHqsTaXZ4QetQWAq5Vmc5lrNngPg94uvJrSfieTt28eTMd\nasn6ndyFAgMBAAECggEADH29qENH2og19yDb/RA96htXw+OIMIi8yJoSgMbJwvLa\nkiuyhFWcHXPXRwgE7zcLlgsguZ9uCpitXVSnmxdpu4xlUwLFCnu/g/NgQ94hQrrW\nSoYi0OG7gsvTZ/4fkAIq8LoKaOwSEWG/Ex+UsJPnBHBDAFtng1joVTDfw/ry1hT+\n4IVvZWnzTkWO6lO7Wy4sMOVT+oG+21VB8WijNaoiS8HRNaTjaqqQEHHgbKvrGvbi\n6Ha54DeA+O84wTTvxSyVcjLS9txo6cYYZfS/xVPlBtOEVG4YkKsAFPRYek3Md8Ut\neqGDgAyKG+TjR/CyZva7Op/t5Hb1jWfaFCoXx3245wKBgQD/3dNq/w+Id0vlTc6D\nCkBJS5QqiFGk17UuIU+jlMKyJ0nQQzy9PTdWy+l7fj/eTKA3SEFPLiIZj8x+RjG+\ny7shzWEFU4RVQM7WyIekavDu1v5PYnzrVQkE+HMS0iPkC2IvzRYUnwvChLrllBGt\nBwnFR0u7guXEMfjG1I3VuD8WVwKBgQDZquUQIA5ZKy+chrhDayS04joOgBFESGvL\njCbD6CO7Vz3BpPZYGv9hFSJF6oOjFtInVS6UsW8nRqFF9PxzuIGL7tnwOgT59bu9\nhRT9EYvOFuacgdJ5enbC6mJwKpcjKpz3+l/OBqPjQsvz9JpwJEoBXVV4Dsl3gpUV\n5wi67CVCgwKBgQD1V0XXDdVeHE3pBO9lFVpJLbBYDDiFINU483YCu6zo2OVdTmua\nZW1/y60I3ijtxnnGKIF/JBRMgGcsGbCva3j3U5CZY9i7SpZKuyPdUzHNQte9VQnF\nOdeZLYZh4J/LleLDRRrMESlcjpsLcix0xg/nW5LRrRUWSHhsZvnNmYrcpwKBgQCk\nu5h2drxFMdDrtm234Fu8ZcYoeTYYJnMmbmBcPdDlFKaRakZh8bS7BaKVpWGQyVGt\nIOOK9yo3YFXnuvxgnA+3FsJr840Wm6pFSXXT/TaAd4Z6hioDc/Jzm616VFFj9Pkt\nF5jwNMhN05zFeaZ0HpK/q6JmpVJGF1a7Z8mMpfGg/wKBgH//+QsUV4eHU/jTMDiU\n57EYY176R4nwEMW2Upix0aintLa+hrNO+QKxtPjiCWxIHH6SJq/VF451K9eqwJ3+\nUu3AtMf0nJ4BSH47rwqNStGO3NI862+XHypc8EskrDjyl7iW19eV0Xg6uet3VDv3\n5AmLFkwHNl7RDNPjjOr+5tUB\n-----END PRIVATE KEY-----\n",
        "client_email":
            "firebase-adminsdk-d3iha@e-comm-firebase-9c2e8.iam.gserviceaccount.com",
        "client_id": "103749493084272411300",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url":
            "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url":
            "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-d3iha%40e-comm-firebase-9c2e8.iam.gserviceaccount.com",
        "universe_domain": "googleapis.com",
      }),
      scopes,
    );
    final acessServerKey = client.credentials.accessToken.data;
    return acessServerKey;
  }
}
