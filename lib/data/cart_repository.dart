import 'dart:collection';

import 'package:shopping_app/models/cart_item.dart';

class CartRepository {
  final List<CartItem> _items = [
    CartItem(
        id: 1,
        image: "shopping_app_assets/watch_1.jpg",
        name: "Apple Watch - M2",
        price: "100",
        description: "",
        size: 30,
        noOfItems: 1),
    CartItem(
        id: 2,
        image: "shopping_app_assets/watch_2.jpg",
        name: "Apple Watch - M2",
        price: "100",
        description: "The watch I got was really beautifully and trendy. "
            "It was the Ben 10 watch, which I am very fond of. "
            "It is red in color and has beautiful Ben 10 pictures.",
        size: 20,
        noOfItems: 1),
    CartItem(
        id: 3,
        image: "shopping_app_assets/watch_2.jpg",
        name: "Apple Watch Series 6",
        price: "100",
        description: "The watch I got was really beautifully and trendy. "
            "It was the Ben 10 watch, which I am very fond of. "
            "It is red in color and has beautiful Ben 10 pictures.",
        size: 20,
        noOfItems: 1),
    CartItem(
        id: 4,
        image: "shopping_app_assets/watch_3.jpg",
        name: "Apple Watch Series 6",
        price: "100",
        description: "The watch I got was really beautifully and trendy. "
            "It was the Ben 10 watch, which I am very fond of. "
            "It is red in color and has beautiful Ben 10 pictures.",
        size: 20,
        noOfItems: 1),
    CartItem(
        id: 5,
        image: "shopping_app_assets/watch_4.jpg",
        name: "Apple Watch Series 6",
        price: "100",
        description: "The watch I got was really beautifully and trendy. "
            "It was the Ben 10 watch, which I am very fond of. "
            "It is red in color and has beautiful Ben 10 pictures.",
        size: 40,
        noOfItems: 1),
    CartItem(
        id: 6,
        image: "shopping_app_assets/watch_5.jpg",
        name: "Apple Watch Series 6",
        price: "100",
        description: "The watch I got was really beautifully and trendy. "
            "It was the Ben 10 watch, which I am very fond of. "
            "It is red in color and has beautiful Ben 10 pictures.",
        size: 50,
        noOfItems: 1),
  ];

  UnmodifiableListView<CartItem> get populatedCartItems => UnmodifiableListView(_items);
}
