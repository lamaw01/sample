import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController
    with SingleGetTickerProviderMixin {
  RxInt tabIndex = 0.obs;

  final int mapTabLength = 2;

  late final TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: mapTabLength, vsync: this);
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
