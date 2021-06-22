import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/global/configs/app_colors.dart';
import 'package:sample/global/shared/coloredsafeare.dart';
import 'package:sample/modules/account/view/account_view.dart';
import 'package:sample/modules/bottomnav/controller/bottomnav_controller.dart';
import 'package:sample/modules/login/view/login_view.dart';
import 'package:sample/modules/map/view/map_view.dart';

class BottomNavWidget extends StatelessWidget {
  BottomNavWidget({Key? key}) : super(key: key);

  final controller = Get.put(BottomNavController());

  final List<Widget> _bodyList = [
    LoginView(),
    MapView(),
    AccountView(),
  ];

  final List<BottomNavigationBarItem> _buttonList = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.map),
      label: 'Map',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Account',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ColoredSafeArea(
        color: AppColors.mainColor,
        child: Scaffold(
          // body: IndexedStack(
          //   index: controller.tabIndex.value,
          //   children: _body,
          // ),
          body: _bodyList[controller.tabIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey[800],
            selectedItemColor: AppColors.mainColor,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            // showSelectedLabels: false,
            // showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 1,
            items: _buttonList,
          ),
        ),
      ),
    );
  }
}
