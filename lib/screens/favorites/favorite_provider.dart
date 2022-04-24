import 'dart:collection';

import 'package:flutter/material.dart';

import '../../models/shopping_item.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<ShoppingItem> _favoriteItems = [];

  UnmodifiableListView<ShoppingItem> get favoriteItems =>
      UnmodifiableListView(_favoriteItems);

  void addToFavorites(ShoppingItem item) {
    if (!_favoriteItems.contains(item)) {
      _favoriteItems.add(item);
    }
    notifyListeners();
  }

  void removeFromFavorites(ShoppingItem item) {
    if (_favoriteItems.contains(item)) {
      _favoriteItems.remove(item);
    }
    notifyListeners();
  }
}
