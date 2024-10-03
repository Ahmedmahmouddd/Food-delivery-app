import 'package:flutter/material.dart';
import 'package:food_delivery_app/home/models/food_model.dart';

class HomeTabBar extends StatelessWidget {
  final TabController tabController;
  const HomeTabBar({super.key, required this.tabController});

  List<Tab> buildCategoryTabBar() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split(".").last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: buildCategoryTabBar(),
      dividerColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Theme.of(context).colorScheme.inversePrimary,
      unselectedLabelColor: Theme.of(context).colorScheme.primary,
      labelColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }
}
