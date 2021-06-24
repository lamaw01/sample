import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample/routes/route_names.dart';
import 'package:sizer/sizer.dart';

import 'routes/route_pages.dart';
import 'services/location_service.dart';
import 'services/storage_service.dart';
import 'theme/app_theme.dart';

Future<void> _initStorageService() async {
  await Get.putAsync<StorageService>(() async => StorageService());
}

Future<void> _initLocationService() async {
  await Get.putAsync<LocationService>(() async => LocationService());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  await GetStorage.init('appstorage');
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  _initStorageService();
  await _initLocationService();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, __, ___) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sample',
          locale: const Locale("en", "US"),
          theme: AppTheme.lightTheme,
          getPages: AppPages.list,
          initialRoute: splashscreen,
        );
      },
    );
  }
}
