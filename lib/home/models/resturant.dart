import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/cart/models/cart_model.dart';
import 'package:food_delivery_app/home/models/food_model.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // Burgers
    Food(
      name: "Classic Cheeseburger",
      image: "assets/burger/burger1.avif", // Add image path here
      description: "Juicy beef patty with melted cheese, lettuce, and tomato.",
      price: 8.99,
      category: FoodCategory.burgers,

      availableAddOns: [
        AddOn(name: "Extra Cheese", price: 1.0),
        AddOn(name: "Bacon", price: 1.5),
        AddOn(name: "Avocado", price: 1.0),
        AddOn(name: "Jalapenos", price: 0.5),
        AddOn(name: "Grilled Onions", price: 0.5),
      ],
    ),
    Food(
      name: "Vegan Burger",
      image: "assets/burger/burger2.avif", // Add image path here
      description: "Plant-based patty with vegan cheese and all the fixings.",
      price: 9.99,
      category: FoodCategory.burgers,
      availableAddOns: [
        AddOn(name: "Vegan Cheese", price: 1.0),
        AddOn(name: "Guacamole", price: 1.5),
        AddOn(name: "Grilled Mushrooms", price: 1.0),
        AddOn(name: "Sriracha Sauce", price: 0.5),
        AddOn(name: "Lettuce Wrap", price: 0.0),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      image: "assets/burger/burger6.jpg", // Add image path here
      description: "Smoky BBQ sauce, crispy bacon, and cheddar cheese.",
      price: 10.49,
      category: FoodCategory.burgers,
      availableAddOns: [
        AddOn(name: "Extra Bacon", price: 1.5),
        AddOn(name: "Onion Rings", price: 1.0),
        AddOn(name: "Pickles", price: 0.5),
        AddOn(name: "Double Patty", price: 3.0),
        AddOn(name: "Barbecue Sauce", price: 0.5),
      ],
    ),
    Food(
      name: "Mushroom Swiss Burger",
      image: "assets/burger/burger3.avif", // Add image path here
      description: "Grilled mushrooms, Swiss cheese, and garlic aioli.",
      price: 9.49,
      category: FoodCategory.burgers,
      availableAddOns: [
        AddOn(name: "Extra Mushrooms", price: 1.0),
        AddOn(name: "Swiss Cheese", price: 1.0),
        AddOn(name: "Garlic Aioli", price: 0.5),
        AddOn(name: "Truffle Oil", price: 1.5),
        AddOn(name: "Lettuce Wrap", price: 0.0),
      ],
    ),
    Food(
      name: "Double cheese double Burger",
      image: "assets/burger/burger4.avif", // Add image path here
      description: "Double beef patty with double melted cheese",
      price: 8.99,
      category: FoodCategory.burgers,
      availableAddOns: [
        AddOn(name: "Extra Spicy Mayo", price: 0.5),
        AddOn(name: "Extra Coleslaw", price: 1.0),
        AddOn(name: "Jalapenos", price: 0.5),
        AddOn(name: "Pickles", price: 0.5),
        AddOn(name: "Cheese", price: 1.0),
      ],
    ),
    Food(
      name: "Bacon Egg Burger",
      image: "assets/burger/burger5.webp", // Add image path here
      description: "Crispy bacon, fried egg, and cheddar cheese.",
      price: 9.99,
      category: FoodCategory.burgers,
      availableAddOns: [
        AddOn(name: "Extra Egg", price: 1.0),
        AddOn(name: "Avocado", price: 1.5),
        AddOn(name: "Bacon", price: 1.5),
        AddOn(name: "Hashbrown", price: 1.0),
        AddOn(name: "Cheddar Cheese", price: 1.0),
      ],
    ),

    // Salads
    Food(
      name: "Caesar Salad",
      image: "assets/salads/salad1.jpg", // Add image path here
      description: "Classic Caesar salad with crisp romaine and parmesan.",
      price: 7.99,
      category: FoodCategory.salads,
      availableAddOns: [
        AddOn(name: "Grilled Chicken", price: 2.0),
        AddOn(name: "Shrimp", price: 3.0),
        AddOn(name: "Bacon Bits", price: 1.0),
        AddOn(name: "Extra Dressing", price: 0.5),
        AddOn(name: "Croutons", price: 0.5),
      ],
    ),
    Food(
      name: "Kale & Quinoa Salad",
      image: "assets/salads/salad2.avif", // Add image path here
      description: "Fresh kale and quinoa with roasted veggies and vinaigrette.",
      price: 8.49,
      category: FoodCategory.salads,

      availableAddOns: [
        AddOn(name: "Avocado", price: 1.0),
        AddOn(name: "Feta Cheese", price: 1.0),
        AddOn(name: "Walnuts", price: 1.0),
        AddOn(name: "Tofu", price: 1.5),
        AddOn(name: "Extra Dressing", price: 0.5),
      ],
    ),
    Food(
      name: "Greek Salad",
      image: "assets/salads/salad5.avif", // Add image path here
      description: "Tomatoes, cucumbers, olives, and feta with Greek dressing.",
      price: 7.99,
      category: FoodCategory.salads,
      availableAddOns: [
        AddOn(name: "Grilled Chicken", price: 4.0),
        AddOn(name: "Olives", price: 1.0),
        AddOn(name: "Feta Cheese", price: 1.0),
        AddOn(name: "Extra Dressing", price: 0.5),
        AddOn(name: "Pita Bread", price: 1.0),
      ],
    ),
    Food(
      name: "Sea Food Salad",
      image: "assets/salads/salad3.avif", // Add image path here
      description: "Grilled mussels, shrimp, and octopus with lemon vinaigrette.",
      price: 8.49,
      category: FoodCategory.salads,
      availableAddOns: [
        AddOn(name: "Extra Mozzarella", price: 1.0),
        AddOn(name: "Balsamic Glaze", price: 0.5),
        AddOn(name: "Avocado", price: 1.0),
      ],
    ),
    Food(
      name: "Egg Breakfast Salad",
      image: "assets/salads/salad4.jpg", // Add image path here
      description: "Crispy bacon, Fresh Veggies, and cheddar cheese.",
      price: 8.99,
      category: FoodCategory.salads,
      availableAddOns: [
        AddOn(name: "Candied Pecans", price: 1.0),
        AddOn(name: "Goat Cheese", price: 1.0),
        AddOn(name: "Avocado", price: 1.0),
        AddOn(name: "Grilled Chicken", price: 2.0),
        AddOn(name: "Balsamic Dressing", price: 0.5),
      ],
    ),
    Food(
      name: "Fruit Salad",
      image: "assets/salads/salad6.webp", // Add image path here
      description: "Five different kinds of fresh fruits.",
      price: 9.49,
      category: FoodCategory.salads,
      availableAddOns: [
        AddOn(name: "Honey", price: 2.0),
        AddOn(name: "Mandarin Oranges", price: 1.0),
        AddOn(name: "Sesame Dressing", price: 0.5),
        AddOn(name: "Avocado", price: 1.0),
        AddOn(name: "Almonds", price: 1.0),
      ],
    ),

    // Drinks
    Food(
      name: "Fresh Lemonade",
      image: "assets/drinks/lemonade.avif", // Add image path here
      description: "Refreshing lemonade made with fresh lemons.",
      price: 3.99,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: "Mint", price: 0.5),
        AddOn(name: "Extra Lemon", price: 0.5),
        AddOn(name: "Honey", price: 0.5),
        AddOn(name: "Ginger", price: 0.5),
      ],
    ),
    Food(
      name: "Iced Coffee",
      image: "assets/drinks/icecoffee.webp", // Add image path here
      description: "Cold brewed coffee served over ice.",
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: "Extra Shot", price: 1.0),
        AddOn(name: "Vanilla Syrup", price: 0.5),
        AddOn(name: "Caramel Syrup", price: 0.5),
        AddOn(name: "Whipped Cream", price: 0.5),
      ],
    ),
    Food(
      name: "Cola",
      image: "assets/drinks/cola.avif", // Add image path here
      description: "Refreshing carbonated soft drink.",
      price: 2.49,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: "Ice", price: 0.5),
        AddOn(name: "Mint", price: 0.5),
      ],
    ),
    Food(
      name: "Strawberry Smoothie",
      image: "assets/drinks/strawberry.avif", // Add image path here
      description: "A creamy blend of strawberries and yogurt.",
      price: 4.49,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: "Protein Powder", price: 1.0),
        AddOn(name: "Chia Seeds", price: 0.5),
        AddOn(name: "Banana", price: 0.5),
        AddOn(name: "Spinach", price: 0.5),
      ],
    ),
    Food(
      name: "Mango Lassi",
      image: "assets/drinks/mango.jpg", // Add image path here
      description: "A traditional Indian drink made with mango and yogurt.",
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: "Extra Mango", price: 1.0),
        AddOn(name: "Cardamom", price: 0.5),
        AddOn(name: "Honey", price: 0.5),
        AddOn(name: "Chia Seeds", price: 0.5),
      ],
    ),

    // Desserts
    Food(
      name: "Chocolate Lava Cake",
      image: "assets/desserts/desserts4.webp", // Add image path here
      description: "Warm chocolate cake with a gooey center.",
      price: 5.99,
      category: FoodCategory.desserts,
      availableAddOns: [
        AddOn(name: "Vanilla Ice Cream", price: 1.5),
        AddOn(name: "Whipped Cream", price: 0.5),
        AddOn(name: "Chocolate Sauce", price: 0.5),
        AddOn(name: "Berries", price: 1.0),
      ],
    ),
    Food(
      name: "Cheesecake",
      image: "assets/desserts/desserts2.avif", // Add image path here
      description: "Creamy cheesecake with a graham cracker crust.",
      price: 4.99,
      category: FoodCategory.desserts,
      availableAddOns: [
        AddOn(name: "Strawberry Sauce", price: 0.5),
        AddOn(name: "Chocolate Chips", price: 0.5),
        AddOn(name: "Caramel Sauce", price: 0.5),
        AddOn(name: "Whipped Cream", price: 0.5),
      ],
    ),
    Food(
      name: "Waffle",
      image: "assets/desserts/desserts5.jpg", // Add image path here
      description: "A classic American breakfast treat.",
      price: 4.49,
      category: FoodCategory.desserts,
      availableAddOns: [
        AddOn(name: "Vanilla Ice Cream", price: 1.5),
        AddOn(name: "Caramel Sauce", price: 0.5),
        AddOn(name: "Whipped Cream", price: 0.5),
        AddOn(name: "Cinnamon", price: 0.5),
      ],
    ),
    Food(
      name: "Tiramisu",
      image: "assets/desserts/dessert1.webp", // Add image path here
      description: "Italian dessert with layers of coffee-soaked sponge.",
      price: 5.49,
      category: FoodCategory.desserts,
      availableAddOns: [
        AddOn(name: "Extra Espresso", price: 0.5),
        AddOn(name: "Cocoa Powder", price: 0.5),
        AddOn(name: "Whipped Cream", price: 0.5),
        AddOn(name: "Chocolate Chips", price: 0.5),
      ],
    ),
    Food(
      name: "Ice Cream Sundae",
      image: "assets/desserts/desserts3.avif", // Add image path here
      description: "Sundae with your choice of toppings.",
      price: 3.99,
      category: FoodCategory.desserts,
      availableAddOns: [
        AddOn(name: "Chocolate Syrup", price: 0.5),
        AddOn(name: "Sprinkles", price: 0.5),
        AddOn(name: "Whipped Cream", price: 0.5),
        AddOn(name: "Nuts", price: 0.5),
      ],
    ),

    // Sides
    Food(
      name: "French Fries",
      image: "assets/sides/sides3.avif", // Add image path here
      description: "Crispy golden fries with a side of ketchup.",
      price: 2.99,
      category: FoodCategory.sides,
      availableAddOns: [
        AddOn(name: "Cheese", price: 1.0),
        AddOn(name: "Bacon Bits", price: 1.0),
        AddOn(name: "Garlic", price: 0.5),
        AddOn(name: "Ranch Sauce", price: 0.5),
      ],
    ),
    Food(
      name: "Macaroni & Cheese",
      image: "assets/sides/sides2.avif", // Add image path here
      description: "Macaroni and cheese with a side of ketchup.",
      price: 3.49,
      category: FoodCategory.sides,
      availableAddOns: [
        AddOn(name: "Barbecue Sauce", price: 0.5),
        AddOn(name: "Spicy Mayo", price: 0.5),
        AddOn(name: "Ranch Sauce", price: 0.5),
        AddOn(name: "Honey Mustard", price: 0.5),
      ],
    ),
    Food(
      name: "Stuffed Potato",
      image: "assets/sides/sides1.jpg", // Add image path here
      description: "Toasted Potato with butter and herbs.",
      price: 2.99,
      category: FoodCategory.sides,
      availableAddOns: [
        AddOn(name: "Cheese", price: 1.0),
        AddOn(name: "Extra Garlic", price: 0.5),
        AddOn(name: "Basil", price: 0.5),
      ],
    ),
    Food(
      name: "Coleslaw",
      image: "assets/sides/sides4.jpg", // Add image path here
      description: "Crunchy coleslaw with a tangy dressing.",
      price: 2.49,
      category: FoodCategory.sides,
      availableAddOns: [
        AddOn(name: "Extra Dressing", price: 0.5),
        AddOn(name: "Bacon Bits", price: 1.0),
        AddOn(name: "Raisins", price: 0.5),
      ],
    ),
  ];

  final List<CartItem> _cart = [];

  String _deliveryaddress = 'Enter you address';

  //  Getter
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryaddress => _deliveryaddress;

  // Modify address
  void upDateAdress(String address) {
    _deliveryaddress = address;
    notifyListeners();
  }

  // add to cart
  void addToCart(Food food, List<AddOn> selectedAddOns) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddOn = ListEquality().equals(item.selectedAddOns, selectedAddOns);
      return isSameFood && isSameAddOn;
    });
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddOns: selectedAddOns));
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartitem) {
    int cartIndex = _cart.indexOf(cartitem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // Get total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemtotal = cartItem.food.price;
      for (AddOn addOn in cartItem.selectedAddOns) {
        itemtotal += addOn.price;
      }
      total += itemtotal * cartItem.quantity;
    }
    return total;
  }

  // Get total number of items in cart
  int getTotalItemsCount() {
    int totalItems = 0;
    for (CartItem cartItem in _cart) {
      totalItems += cartItem.quantity;
    }
    return totalItems;
  }

  // Clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // Display cart receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt");
    receipt.writeln();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------------------");
    for (final cartItem in cart) {
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} = ${formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddOns.isNotEmpty) {
        receipt.writeln(" Add-ons: ${fromAddons(cartItem.selectedAddOns)}");
      }
      receipt.writeln();
    }
    receipt.writeln("----------------------");
    receipt.writeln();
    receipt.writeln("Total items: ${getTotalItemsCount()}");
    receipt.writeln("Total items: ${formatPrice(getTotalPrice())}");
    receipt.writeln("Delivery address : $deliveryaddress");

    return receipt.toString();
  }

  // Format price
  String formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // Format addons
  String fromAddons(List<AddOn> addons) {
    return addons.map((addon) => "${addon.name} (${formatPrice(addon.price)})").join(", ");
  }
}
