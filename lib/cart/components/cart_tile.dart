import 'package:flutter/material.dart';
import 'package:food_delivery_app/cart/components/quantity_selector.dart';
import 'package:food_delivery_app/cart/models/cart_model.dart';
import 'package:food_delivery_app/home/models/resturant.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;
  const CartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          cartItem.food.image,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        )),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.food.name,
                          // style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          r'$' + cartItem.food.price.toString(),
                          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                        ),
                      ],
                    ),
                    Spacer(),
                    QuantitySelector(
                        quanity: cartItem.quantity,
                        food: cartItem.food,
                        onIncrement: () {
                          restaurant.addToCart(cartItem.food, cartItem.selectedAddOns);
                        },
                        onDecrement: () {
                          restaurant.removeFromCart(cartItem);
                        }),
                  ],
                ),
              ),
              SizedBox(
                  height: cartItem.selectedAddOns.isEmpty ? 0 : 45,
                  child: ListView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                      scrollDirection: Axis.horizontal,
                      children: cartItem.selectedAddOns
                          .map((addon) => Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: FilterChip(
                                  label: Row(
                                      children: [Text(addon.name), Text(' (\$${addon.price.toString()})')]),
                                  onSelected: (value) {},
                                  backgroundColor: Theme.of(context).colorScheme.secondary,
                                  labelStyle: TextStyle(
                                      color: Theme.of(context).colorScheme.inversePrimary, fontSize: 12),
                                  shape: StadiumBorder(
                                      side: BorderSide(color: Theme.of(context).colorScheme.primary)),
                                ),
                              ))
                          .toList())),
            ],
          ),
        );
      },
    );
  }
}
