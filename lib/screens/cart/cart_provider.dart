import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shopping_app/data/cart_repository.dart';
import 'package:shopping_app/models/cart_item.dart';

class ShoppingCartProvider extends ChangeNotifier {
  //final List<CartItem> cartItems = CartRepository().populatedCartItems;

  final List<CartItem> _cartItems = [];

  int totalPrice = 0;

  //UnmodifiableListView<CartItem> get populatedCartItems => UnmodifiableListView(cartItems);

  UnmodifiableListView<CartItem> get cartItems => UnmodifiableListView(_cartItems);

  void add(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeAll() {
    _cartItems.clear();
    notifyListeners();
  }

  void payForItemsInCart(){
    removeAll();
  }

  void decrementNoOfItemsInCart(int index) {
    final item = _cartItems[index];
    if (item.noOfItems > 1) {
      item.noOfItems--;
    }
    notifyListeners();
  }

  void incrementNoOfItemsInCart(int index) {
    _cartItems[index].noOfItems++;
    notifyListeners();
  }

  void calculateTotalPrice() {
    totalPrice = _cartItems.fold(0, (previousValue, element) => (int.parse(element.price)) + previousValue);
    notifyListeners();
  }
}
