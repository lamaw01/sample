import 'package:get/get.dart';
import 'package:sample/modules/login/view/login_view.dart';
import 'package:sample/modules/splashscreen/view/splashscreen_view.dart';

class AppPages {
  static var list = [
    GetPage(
      name: "/splashscreen",
      page: () => SplashScreenView(),
    ),
    GetPage(
      name: "/login",
      page: () => LoginView(),
    ),
  ];
}
