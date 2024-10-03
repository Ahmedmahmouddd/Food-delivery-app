import 'package:flutter/material.dart';

showCustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.secondary),
      ),
      behavior: SnackBarBehavior.floating, // Makes the SnackBar float
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12), // Adds margin around the SnackBar
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2), // Adds rounded corners
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Customize the color if needed
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Adds padding inside the SnackBar
    ),
  );
}
