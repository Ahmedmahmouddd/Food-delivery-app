import 'package:flutter/material.dart';
import 'package:food_delivery_app/home/models/food_model.dart';

class QuantitySelector extends StatelessWidget {
  final int quanity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const QuantitySelector(
      {super.key,
      required this.quanity,
      required this.food,
      required this.onIncrement,
      required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onDecrement,
            child: Icon(Icons.remove, size: 20, color: Theme.of(context).colorScheme.primary),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(width: 20, child: Center(child: Text(quanity.toString()))),
          ),
          GestureDetector(
            onTap: onIncrement,
            child: Icon(Icons.add, size: 20, color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
