import 'package:flutter/material.dart';
import 'package:food_delivery_app/cart/models/cart_model.dart';
import 'package:food_delivery_app/home/models/resturant.dart';
import 'package:food_delivery_app/home/screens/home_page.dart';
import 'package:provider/provider.dart';

class ClearCartButton extends StatelessWidget {
  const ClearCartButton({
    super.key,
    required this.userCart,
  });

  final List<CartItem> userCart;

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => IconButton(
        icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.inversePrimary),
        onPressed: userCart.isEmpty
            ? () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Cart is already empty, add items now !',
                      style: TextStyle(fontSize: 20),
                    ),
                    actions: [
                      TextButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text("Home"),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const HomePage();
                          }));
                        },
                      ),
                    ],
                  ),
                );
              }
            : () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(
                            'Sure you want to Clear Cart ?',
                            style: TextStyle(fontSize: 20),
                          ),
                          actions: [
                            TextButton(
                              child: Text("Cancel"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: Text("Clear"),
                              onPressed: () {
                                restaurant.clearCart();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ));
              },
      ),
    );
  }
}
