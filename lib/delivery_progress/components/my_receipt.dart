import 'package:flutter/material.dart';
import 'package:food_delivery_app/home/models/resturant.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Center(
        child: Column(
          children: [
            Text("Thank you for your order!"),
            SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.tertiary),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Consumer<Restaurant>(
                    builder: (context, restaurant, child) => Text(restaurant.displayCartReceipt())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
