import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/global/configs/app_colors.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.mainColor,
    accentColor: AppColors.mainColor,
    brightness: Brightness.light,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    fontFamily: GoogleFonts.pacifico().fontFamily,
    // fontFamily: 'Georgia',
    textTheme: TextTheme(
      caption: TextStyle(fontSize: 18.sp),
    ),
  );
}
