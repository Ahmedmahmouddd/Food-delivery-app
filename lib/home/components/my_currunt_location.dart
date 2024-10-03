import 'package:flutter/material.dart';
import 'package:food_delivery_app/home/models/resturant.dart';
import 'package:provider/provider.dart';

class MyCurruntLocation extends StatefulWidget {
  const MyCurruntLocation({super.key});

  @override
  State<MyCurruntLocation> createState() => _MyCurruntLocationState();
}

class _MyCurruntLocationState extends State<MyCurruntLocation> {
  final TextEditingController textEditingController = TextEditingController();

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your location"),
        content: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
                hintText: "Enter your location..",
                hintStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary))),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary))),
          TextButton(
              onPressed: () {
                String newAddress = textEditingController.text;
                context.read<Restaurant>().upDateAdress(newAddress);
                Navigator.pop(context);
              },
              child: Text("Save", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver now",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Consumer<Restaurant>(
                    builder: (context, restaurant, child) => Text(restaurant.deliveryaddress,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold))),
                Icon(Icons.keyboard_arrow_down_rounded, color: Theme.of(context).colorScheme.inversePrimary),
              ],
            ),
          )
        ],
      ),
    );
  }
}
