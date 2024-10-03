class Food {
  final String name;
  final String image;
  final String description;
  final double price;
  final FoodCategory category;
  final List<AddOn> availableAddOns;

  Food(
      {required this.name, required this.image, required this.description, required this.price,required this.availableAddOns,required this.category});
}

enum FoodCategory {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}

class AddOn {
  final String name;
  final double price;

  AddOn({required this.name, required this.price});
}
