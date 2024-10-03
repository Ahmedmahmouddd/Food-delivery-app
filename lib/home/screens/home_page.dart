import 'package:flutter/material.dart';
import 'package:food_delivery_app/food_details/screens/food_page.dart';
import 'package:food_delivery_app/home/components/discription_box.dart';
import 'package:food_delivery_app/home/components/food_tile.dart';
import 'package:food_delivery_app/home/components/home_drawer.dart';
import 'package:food_delivery_app/home/components/home_tabbar.dart';
import 'package:food_delivery_app/home/components/my_currunt_location.dart';
import 'package:food_delivery_app/home/components/sliver_appbar.dart';
import 'package:food_delivery_app/home/models/food_model.dart';
import 'package:food_delivery_app/home/models/resturant.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
// Filtering the food in menu by category 
  List<Food> filterMenuByCategory(List<Food> menu, FoodCategory category) {
    return menu.where((food) => food.category == category).toList();
  }

// Getting the food that will show in each category in body
  List<Widget> getFoodInThisCategory(List<Food> menu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = filterMenuByCategory(menu, category);
      return ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: categoryMenu.length,
          itemBuilder: (context, index) {
            return FoodTile(
                food: categoryMenu[index],
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FoodPage(food: categoryMenu[index]);
                  }));
                });
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      body: Container(
        color: Theme.of(context).colorScheme.tertiary,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScolled) => [
            CustomSliverAppbar(
              title: HomeTabBar(tabController: _tabController),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(indent: 25, endIndent: 25, color: Theme.of(context).colorScheme.secondary),
                  const SizedBox(height: 15),
                  // My currunt location
                  const MyCurruntLocation(),
                  //  Description box
                  const DiscriptionBox(),
                ],
              ),
            ),
          ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) => TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu),
            ),
          ),
        ),
      ),
    );
  }
}
