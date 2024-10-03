import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String title;

  const CustomButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            title,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
      ),
    );
  }
}
