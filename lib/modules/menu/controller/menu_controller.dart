import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MenuController extends GetxController with SingleGetTickerProviderMixin {
  late final TabController tabController;

  final int itemLength = 10;

  final List<Tab> tabs = [
    Tab(
      child: Text('0fasfas'),
    ),
    Tab(
      child: Text('1asfasf'),
    ),
    Tab(
      child: Text('2zxczxc'),
    ),
    Tab(
      child: Text('3zxczxcxz'),
    ),
    Tab(
      child: Text('4jfgjgfjfg'),
    ),
    Tab(
      child: Text('5qweqweqw'),
    ),
    Tab(
      child: Text('6asfczxcz'),
    ),
    Tab(
      child: Text('7cvnvbbbg'),
    ),
    Tab(
      child: Text('8mvbhngf'),
    ),
    Tab(
      child: Text('9klghjfgvb'),
    ),
  ];

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      initialIndex: 0,
      length: itemLength,
      vsync: this,
    );
  }
}
