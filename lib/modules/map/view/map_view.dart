import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/modules/map/controller/map_controller.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(MapController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Center(child: Text('Map')),
    );
  }
}
