import 'package:firebase_messaging/firebase_messaging.dart';

/// This function must be a top-level function to handle background messages.
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  // print("Title: ${message.notification?.title}");
  // print("Body: ${message.notification?.body}");
  // print("Payload: ${message.data}");
  print("Handling a background message: ${message.messageId}");
}

class FirebaseApi {
  final firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotofication() async {
    await firebaseMessaging.requestPermission();
    final String? FCMToken = await firebaseMessaging.getToken();
    print("FCM Token: $FCMToken");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
