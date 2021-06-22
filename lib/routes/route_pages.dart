import 'package:get/get.dart';
import 'package:sample/modules/bottomnav/view/bottomnav_widget.dart';
import 'package:sample/modules/login/view/login_view.dart';
import 'package:sample/modules/map/view/map_view.dart';
import 'package:sample/modules/splashscreen/view/splashscreen_view.dart';

class AppPages {
  static var list = [
    GetPage(
      name: "/",
      page: () => SplashScreenView(),
    ),
    GetPage(
      name: "/login",
      page: () => LoginView(),
    ),
    GetPage(
      name: "/bottomnav",
      page: () => BottomNavWidget(),
    ),
    GetPage(
      name: "/map",
      page: () => MapView(),
    ),
  ];
}
