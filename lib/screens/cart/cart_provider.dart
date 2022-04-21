import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shopping_app/data/cart_repository.dart';
import 'package:shopping_app/models/cart_item.dart';

class ShoppingCartProvider extends ChangeNotifier {
  final List<CartItem> _populatedItems = CartRepository().populatedCartItems;

  //final List<CartItem> _items = [];

  int totalPrice = 0;

  UnmodifiableListView<CartItem> get populatedCartItems =>
      UnmodifiableListView(_populatedItems);

  //UnmodifiableListView<CartItem> get cartItems => UnmodifiableListView(_items);

  void add(CartItem item) {
    _populatedItems.add(item);
    notifyListeners();
  }

  void removeAll() {
    _populatedItems.clear();
    notifyListeners();
  }

  void decrementNoOfItemsInCart(int index) {
    final item = _populatedItems[index];
    if (item.noOfItems > 1) {
      item.noOfItems--;
    }
    notifyListeners();
  }

  void incrementNoOfItemsInCart(int index) {
    _populatedItems[index].noOfItems++;
    notifyListeners();
  }

  void calculateTotalPrice() {
    totalPrice = _populatedItems.fold(0, (previousValue, element) => (int.parse(element.price)) + previousValue);
    notifyListeners();
  }
}
