import 'package:flutter/material.dart';
import 'package:sample/global/configs/app_colors.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    // primarySwatch: Colors.teal,
    primaryColor: AppColors.mainColor,
    accentColor: AppColors.mainColor,
    brightness: Brightness.light,

    fontFamily: 'Georgia',
    textTheme: TextTheme(
      caption: TextStyle(fontSize: 18.sp),
    ),
  );
}
