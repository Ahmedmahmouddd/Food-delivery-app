import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/components/custom_button.dart';
import 'package:food_delivery_app/home/models/food_model.dart';
import 'package:food_delivery_app/home/models/resturant.dart';

import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<AddOn, bool> selectedAddOns = {};

  FoodPage({
    super.key,
    required this.food,
  }) {
    // Initialize selectedAddOns to be false
    for (AddOn addon in food.availableAddOns) {
      selectedAddOns[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart(Food food, Map<AddOn, bool> selectedAddOns) {
    Navigator.pop(context);
    List<AddOn> currentlySelectedAddOns = [];
    for (AddOn addon in widget.food.availableAddOns) {
      if (widget.selectedAddOns[addon] == true) {
        currentlySelectedAddOns.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddOns);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: ListView(
            children: [
              Image.asset(widget.food.image),
              Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.food.name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    Text(
                      r'$' + widget.food.price.toString(),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    Text(
                      widget.food.description,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    Divider(indent: 25, endIndent: 25, color: Theme.of(context).colorScheme.secondary),
                    SizedBox(height: 15),
                    Text(
                      "Add Ons",
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Theme.of(context).colorScheme.tertiary),
                      ),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.food.availableAddOns.length,
                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                            activeColor: Theme.of(context).colorScheme.inversePrimary,
                            title: Text(widget.food.availableAddOns[index].name),
                            subtitle: Text(r'$' + widget.food.availableAddOns[index].price.toString(),
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold)),
                            value: widget.selectedAddOns[widget.food.availableAddOns[index]],
                            onChanged: (bool? value) {
                              setState(() {
                                widget.selectedAddOns[widget.food.availableAddOns[index]] = value!;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(onTap: () => addToCart(widget.food, widget.selectedAddOns), title: "Add to cart"),
              const SizedBox(height: 25)
            ],
          ),
        ),
        SafeArea(
          child: Opacity(
            opacity: 0.5,
            child: Container(
                margin: const EdgeInsets.only(left: 15, top: 10),
                decoration:
                    BoxDecoration(color: Theme.of(context).colorScheme.surface, shape: BoxShape.circle),
                child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_rounded,
                        color: Theme.of(context).colorScheme.inversePrimary),
                    onPressed: () {
                      Navigator.pop(context);
                    })),
          ),
        )
      ],
    );
  }
}
