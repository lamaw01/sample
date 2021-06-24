import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MenuController extends GetxController with SingleGetTickerProviderMixin {
  late final TabController tabController;

  final int itemLength = 10;

  final List<Tab> tabs = [
    Tab(
      child: Text('0'),
    ),
    Tab(
      child: Text('1'),
    ),
    Tab(
      child: Text('2'),
    ),
    Tab(
      child: Text('3'),
    ),
    Tab(
      child: Text('4'),
    ),
    Tab(
      child: Text('5'),
    ),
    Tab(
      child: Text('6'),
    ),
    Tab(
      child: Text('7'),
    ),
    Tab(
      child: Text('8'),
    ),
    Tab(
      child: Text('9'),
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
