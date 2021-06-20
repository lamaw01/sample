import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FirebaseService extends GetxService {
  static FirebaseService c = Get.find();

  String? token;

  late FirebaseMessaging messaging;

  @override
  void onInit() async {
    super.onInit();
    messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');

        if (message.notification != null) {
          print(
            'Message also contained a notification: ${message.notification}',
          );
        }
      },
    );
  }

  Future getToken() async {
    token = await messaging.getToken(
      vapidKey:
          "BFbDVidklddrhAa7G36711IqccmJDfrB367VXB39vgFqwG1X8CV7t8kq7aHFmwRwE6ma9e89Bq3_4tl1hID0TsE",
    );

    print('User Token: $token');
  }
}
