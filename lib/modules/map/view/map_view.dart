import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/modules/bottomnav/controller/bottomnav_controller.dart';
import 'package:sample/modules/map/controller/map_controller.dart';

class MapView extends StatelessWidget {
  MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(MapController());

    final bottomNavC = Get.find<BottomNavController>();

    Widget _firstText() {
      return Center(child: Text('First body'));
    }

    Widget _secondText() {
      return Center(child: Text('Second body'));
    }

    return DefaultTabController(
      length: bottomNavC.mapTabLength,
      child: Scaffold(
        body: TabBarView(
          controller: bottomNavC.tabController,
          children: [
            _firstText(),
            _secondText(),
          ],
        ),
      ),
    );
  }
}
