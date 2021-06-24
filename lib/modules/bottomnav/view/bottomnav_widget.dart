import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sample/global/configs/app_colors.dart';
import 'package:sample/global/shared/colored_safeare.dart';
import 'package:sample/modules/account/view/account_view.dart';
import 'package:sample/modules/bottomnav/controller/bottomnav_controller.dart';
import 'package:sample/modules/bottomnav/widget/drawer_widget.dart';
import 'package:sample/modules/login/view/login_view.dart';
import 'package:sample/modules/map/view/map_view.dart';
import 'package:sample/modules/menu/view/menu_view.dart';
import 'package:sample/services/location_service.dart';

class BottomNavWidget extends StatelessWidget {
  BottomNavWidget({Key? key}) : super(key: key);

  static final controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ColoredSafeArea(
        color: AppColors.mainColor,
        child: Scaffold(
          appBar: _appBars[controller.tabIndex.value],
          drawer: AppDrawer(),
          body: _bodyList[controller.tabIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey[800],
            selectedItemColor: AppColors.mainColor,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.shifting,
            backgroundColor: Colors.white,
            elevation: 1,
            items: _buttonList,
          ),
        ),
      ),
    );
  }

  final List<Widget> _bodyList = [
    LoginView(),
    MapView(),
    AccountView(),
    MenuView(),
  ];

  final List _appBars = [
    //Home Appbar
    AppBar(
      title: Text('Home'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/alarm.svg',
            width: 20,
            height: 20,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.refresh,
          ),
        ),
      ],
    ),
    //Map Appbar
    AppBar(
      title: Text('Map'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
          ),
        ),
      ],
      bottom: TabBar(
        controller: controller.tabController,
        isScrollable: false,
        tabs: [
          Tab(
            child: Obx(
              () => Text(
                'First ${LocationService.instance.position.value.latitude}',
              ),
            ),
          ),
          Tab(
            child: Obx(
              () => Text(
                'Second ${LocationService.instance.position.value.longitude}',
              ),
            ),
          ),
        ],
      ),
    ),
    //Map Account
    AppBar(
      title: Text('Account'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings,
          ),
        )
      ],
    ),
    //Menu null
    null,
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
    BottomNavigationBarItem(
      icon: Icon(Icons.menu),
      label: 'Menu',
    ),
  ];
}
