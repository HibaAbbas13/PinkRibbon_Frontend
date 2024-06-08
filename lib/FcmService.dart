import 'package:firebase_messaging/firebase_messaging.dart';
import 'database_helper.dart';

class FCMService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> init() async {
    _firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleMessage(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleMessage(message);
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _handleMessage(RemoteMessage message) async {
    if (message.notification != null) {
      final notification = {
        'title': message.notification!.title,
        'body': message.notification!.body,
        'receivedAt': DateTime.now().toIso8601String(),
      };
      await DatabaseHelper().insertNotification(notification);
    }
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    if (message.notification != null) {
      final notification = {
        'title': message.notification!.title,
        'body': message.notification!.body,
        'receivedAt': DateTime.now().toIso8601String(),
      };
      await DatabaseHelper().insertNotification(notification);
    }
  }
}
