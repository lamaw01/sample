import 'package:flutter/material.dart';
import 'package:sample/global/configs/app_colors.dart';

class GlobalLoading extends StatelessWidget {
  const GlobalLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(AppColors.mainColor),
      ),
    );
  }
}
