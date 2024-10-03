// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_delivery_app/home/models/food_model.dart';

class CartItem {
  Food food;
  List<AddOn> selectedAddOns;
  int quantity;

  CartItem({required this.food, required this.selectedAddOns, this.quantity = 1});

  double get totalPrice {
    double addOnsPrice = selectedAddOns.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addOnsPrice) * quantity;
  }
}
