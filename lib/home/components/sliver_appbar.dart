import 'package:flutter/material.dart';
import 'package:food_delivery_app/cart/screens/cart_page.dart';

class CustomSliverAppbar extends StatelessWidget {
  final Widget title;
  final Widget child;
  const CustomSliverAppbar({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
      backgroundColor: Theme.of(context).colorScheme.surface,
      expandedHeight: 300,
      collapsedHeight: 110,
      floating: false,
      pinned: true,
      centerTitle: true,
      title: const Text("Home"),
      flexibleSpace: FlexibleSpaceBar(
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        expandedTitleScale: 1,
        background: Padding(padding: const EdgeInsets.only(bottom: 30.0), child: child),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CartPage();
                }));
              },
              icon: Icon(Icons.shopping_cart_outlined, color: Theme.of(context).colorScheme.inversePrimary)),
        )
      ],
    );
  }
}
