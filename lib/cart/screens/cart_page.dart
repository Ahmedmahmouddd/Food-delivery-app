import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/components/custom_button.dart';
import 'package:food_delivery_app/cart/components/cart_tile.dart';
import 'package:food_delivery_app/cart/components/clear_cart_button.dart';
import 'package:food_delivery_app/home/models/resturant.dart';
import 'package:food_delivery_app/payment/screens/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final userCart = restaurant.cart;
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_rounded, color: Theme.of(context).colorScheme.inversePrimary)),
          elevation: 0,
          title: Text('Cart'),
          centerTitle: true,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [ClearCartButton(userCart: userCart)],
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? Expanded(child: Center(child: Text('Add Itmes to your cart now!')))
                      : Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                final cartItem = userCart[index];
                                return CartTile(
                                  cartItem: cartItem,
                                );
                              }),
                        )
                ],
              ),
            ),
            userCart.isEmpty
                ? Container()
                : Column(
                    children: [
                      SizedBox(height: 15),
                      CustomButton(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const PaymentPage();
                            }));
                          },
                          title: "Go to checkout"),
                      SizedBox(height: 25),
                    ],
                  ),
          ],
        ),
      );
    });
  }
}
