import 'package:flutter/material.dart';

class DiscriptionBox extends StatelessWidget {
  const DiscriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).colorScheme.secondary)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Delivery fee
          Column(
            children: [
              Text(r"$0.99",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold)),
              Text(
                "Delivery fee",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),

          // Delivery time
          Column(
            children: [
              Text(r"15-30 min",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold)),
              Text(
                "Delivery time",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
