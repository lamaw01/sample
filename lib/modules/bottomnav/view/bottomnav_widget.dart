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

  static final controller = Get.put(BottomNavController());

  final List<Widget> _bodyList = [
    LoginView(),
    MapView(),
    AccountView(),
  ];

  final List<AppBar> appBars = [
    AppBar(
      title: Text('Home'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.refresh,
          ),
        )
      ],
    ),
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
            child: Text('First'),
          ),
          Tab(
            child: Text('Second'),
          ),
        ],
      ),
    ),
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
  ];

  Drawer _drawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Botox Yamate'),
            accountEmail: Text('botox@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: FlutterLogo(),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.black),
            title: Text('Settings'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.black),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }

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
          appBar: appBars[controller.tabIndex.value],
          drawer: _drawer(),
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