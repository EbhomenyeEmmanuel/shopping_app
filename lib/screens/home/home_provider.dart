import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:shopping_app/data/home_repository.dart';
import 'package:shopping_app/models/shopping_item.dart';

class HomeProvider extends ChangeNotifier {
  final List<ShoppingItem> _items = HomeRepository().shoppingItems;
  final List<ShoppingItem> _favoriteItems = [];

  int shoppingItemSize = 0;
  int shoppingCategoryPosition = 0;

  UnmodifiableListView<ShoppingItem> get items => UnmodifiableListView(_items);

  UnmodifiableListView<ShoppingItem> get favoriteItems =>
      UnmodifiableListView(_favoriteItems);

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
      _addToFavorites(item);
    } else {
      _removeFromFavorites(item);
    }
    notifyListeners();
  }

  void _addToFavorites(ShoppingItem item) {
    //Add & save
    _favoriteItems.add(item);
    notifyListeners();
  }

  void _removeFromFavorites(ShoppingItem item) {
    for (final shoppingItem in _favoriteItems) {
      if (shoppingItem.id == item.id) {
        _favoriteItems.remove(item);
        break;
      }
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
