import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/global/configs/app_colors.dart';
import 'package:sample/global/constants/asset_path.dart';
import 'package:sample/global/widgets/colored_tabbar.dart';
import 'package:sample/modules/menu/controller/menu_controller.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(MenuController());

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          // snap: true,
          pinned: true,
          floating: false,
          expandedHeight: 250,
          title: Text('Menu'),
          flexibleSpace: FlexibleSpaceBar(
            // title: Text('Sub menu'),
            centerTitle: true,
            collapseMode: CollapseMode.parallax,
            background: Image.asset(
              AssetPath.jollibee,
              fit: BoxFit.cover,
            ),
            stretchModes: [
              StretchMode.fadeTitle,
            ],
          ),
          bottom: ColoredTabBar(
            AppColors.mainColor,
            TabBar(
              isScrollable: true,
              controller: controller.tabController,
              tabs: controller.tabs,
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50,
          delegate: SliverChildListDelegate([
            Container(color: Colors.red),
            Container(color: Colors.green),
            Container(color: Colors.blue),
          ]),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                height: 50,
                alignment: Alignment.center,
                color: Colors.orange[100 * (index % 9)],
                child: Text('orange $index'),
              );
            },
            childCount: 10,
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            },
            childCount: 35,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 2.0,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.yellow,
            padding: const EdgeInsets.all(8.0),
            child: Text('Grid Header', style: TextStyle(fontSize: 24)),
          ),
        ),
        SliverGrid.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 4.0,
          children: <Widget>[
            Container(color: Colors.red),
            Container(color: Colors.green),
            Container(color: Colors.blue),
            Container(color: Colors.red),
            Container(color: Colors.green),
            Container(color: Colors.blue),
          ],
        ),
        SliverGrid.extent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 4.0,
          children: <Widget>[
            Container(color: Colors.pink),
            Container(color: Colors.indigo),
            Container(color: Colors.orange),
            Container(color: Colors.pink),
            Container(color: Colors.indigo),
            Container(color: Colors.orange),
          ],
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.yellow,
            padding: const EdgeInsets.all(8.0),
            child: Text('Grid Header', style: TextStyle(fontSize: 24)),
          ),
        ),
        SliverFillRemaining(
          child: ScrollablePositionedList.builder(
            itemScrollController: controller.itemScrollController,
            itemPositionsListener: controller.itemPositionsListener,
            itemCount: controller.itemLength,
            itemBuilder: (_, int index) {
              return Container(
                height: 400,
                color: Colors.pinkAccent,
                child: Center(
                  child: Text('$index'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
