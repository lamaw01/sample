import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'core/services/location_service.dart';
import 'core/services/storage_service.dart';
import 'routes/route_pages.dart';
import 'theme/app_theme.dart';

void main() async {
  await GetStorage.init('appstorage');
  WidgetsFlutterBinding.ensureInitialized();
  _initStorageService();
  _initLocationService();
  runApp(MyApp());
}

Future<void> _initStorageService() async {
  await Get.putAsync<StorageService>(() async => StorageService());
}

Future<void> _initLocationService() async {
  await Get.putAsync<LocationService>(() async => LocationService());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sample',
        locale: const Locale("en", "US"),
        theme: AppTheme.lightTheme,
        getPages: AppPages.list,
        initialRoute: "/",
      );
    });
  }
}
