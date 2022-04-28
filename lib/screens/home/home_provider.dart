import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shopping_app/data/home_repository.dart';
import 'package:shopping_app/models/shopping_item.dart';
import 'package:shopping_app/screens/favorites/favorite_provider.dart';

class HomeProvider extends ChangeNotifier {
  final List<ShoppingItem> _items = HomeRepository().shoppingItems;

  late FavoriteProvider? favoriteProvider;
  int shoppingItemSize = 0;
  int shoppingCategoryPosition = 0;

  void update(FavoriteProvider favoriteProvider) {
    this.favoriteProvider = favoriteProvider;
  }

  UnmodifiableListView<ShoppingItem> get items => UnmodifiableListView(_items);

  void add(ShoppingItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  void toggleFavoriteStatus(int index) {
    final isFavorite = !_items[index].isChecked;
    final item = _items[index];
    _items[index].isChecked = isFavorite;
    if (isFavorite) {
      favoriteProvider?.addToFavorites(item);
    } else {
      favoriteProvider?.removeFromFavorites(item);
    }
    notifyListeners();
  }

  void setShoppingItemSize(int size) {
    shoppingItemSize = size;
    notifyListeners();
  }

  void setShoppingCategoryPosition(int position) {
    shoppingCategoryPosition = position;
    notifyListeners();
  }
}
