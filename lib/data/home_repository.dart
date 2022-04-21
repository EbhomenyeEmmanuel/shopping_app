import 'dart:collection';

import 'package:shopping_app/models/shopping_item.dart';

class HomeRepository {
  final List<ShoppingItem> _items = [
    ShoppingItem(
        id: 0,
        images: ["shopping_app_assets/watch_1.jpg"],
        name: "Apple Watch - M2",
        noOfReviews: 0,
        newPrice: "100",
        oldPrice: "N130",
        availabilityDescription: "Available in stock",
        description: "",
        discount: 30,
        sizes: ['35', '36', '37', '38', '39', '40', '41', '42'],
        isChecked: false),
    ShoppingItem(
        id: 1,
        images: ["shopping_app_assets/watch_2.jpg"],
        name: "Apple Watch Series 7",
        noOfReviews: 200,
        newPrice: "N140",
        oldPrice: "N200",
        availabilityDescription: "Available in stock",
        description: "The watch I got was really beautifully and trendy. "
            "It was the Ben 10 watch, which I am very fond of. "
            "It is red in color and has beautiful Ben 10 pictures.",
        discount: 20,
        sizes: ['35', '36', '37', '38', '39', '40', '41', '42'],
        isChecked: false),
    ShoppingItem(
        id: 2,
        images: ["shopping_app_assets/watch_2.jpg"],
        name: "Apple Watch Series 6",
        noOfReviews: 0,
        newPrice: "N140",
        oldPrice: "N200",
        availabilityDescription: "Available in stock",
        description: "The watch I got was really beautifully and trendy. "
            "It was the Ben 10 watch, which I am very fond of. "
            "It is red in color and has beautiful Ben 10 pictures.",
        discount: 20,
        sizes: ['35', '36', '37', '38', '39', '40', '41', '42'],
        isChecked: false),
    ShoppingItem(
        id: 3,
        images: ["shopping_app_assets/watch_3.jpg"],
        name: "Apple Watch Series 6",
        noOfReviews: 0,
        newPrice: "N140",
        oldPrice: "N200",
        availabilityDescription: "Available in stock",
        description: "The watch I got was really beautifully and trendy. "
            "It was the Ben 10 watch, which I am very fond of. "
            "It is red in color and has beautiful Ben 10 pictures.",
        discount: 20,
        sizes: ['35', '36', '37', '38', '39', '40', '41', '42'],
        isChecked: false),
    ShoppingItem(
        id: 4,
        images: ["shopping_app_assets/watch_4.jpg"],
        name: "Apple Watch Series 6",
        noOfReviews: 0,
        newPrice: "N140",
        oldPrice: "N200",
        availabilityDescription: "Available in stock",
        description: "The watch I got was really beautifully and trendy. "
            "It was the Ben 10 watch, which I am very fond of. "
            "It is red in color and has beautiful Ben 10 pictures.",
        discount: 20,
        sizes: ['35', '36', '37', '38', '39', '40', '41', '42'],
        isChecked: false),
    ShoppingItem(
        id: 5,
        images: ["shopping_app_assets/watch_5.jpg"],
        name: "Apple Watch Series 6",
        noOfReviews: 0,
        newPrice: "N140",
        oldPrice: "N200",
        availabilityDescription: "Available in stock",
        description: "The watch I got was really beautifully and trendy. "
            "It was the Ben 10 watch, which I am very fond of. "
            "It is red in color and has beautiful Ben 10 pictures.",
        discount: 20,
        sizes: ['35', '36', '37', '38', '39', '40', '41', '42'],
        isChecked: false),
  ];

  UnmodifiableListView<ShoppingItem> get shoppingItems =>
      UnmodifiableListView(_items);
}
