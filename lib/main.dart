import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'routes/route_pages.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(MyApp());
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
        initialRoute: "/splashscreen",
      );
    });
  }
}
