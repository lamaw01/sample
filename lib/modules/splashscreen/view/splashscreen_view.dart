import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/global/configs/app_colors.dart';
import 'package:sample/global/shared/coloredsafeare.dart';
import 'package:sample/modules/splashscreen/controller/splashscreen_controller.dart';

class SplashScreenView extends StatelessWidget {
  SplashScreenView({Key? key}) : super(key: key);

  final controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      color: AppColors.backgroundColor,
      child: Scaffold(
        body: Center(
          child: Text('Loading...'),
        ),
      ),
    );
  }
}
