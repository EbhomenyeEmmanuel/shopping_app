import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shopping_app/data/home_repository.dart';
import 'package:shopping_app/models/shopping_item.dart';
import 'package:shopping_app/screens/favorites/favorite_provider.dart';

class HomeProvider extends ChangeNotifier {
  final List<ShoppingItem> _items = HomeRepository().shoppingItems;

  late FavoriteProvider? favoriteProvider;
  int selectedShoppingItemSizeIndex = 0;
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
    //TODO(Removing an item in a random order causes an old state in the list)
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

  void setSelectedShoppingItemSize(int index, int shoppingItemSizeIndex) {
    selectedShoppingItemSizeIndex = shoppingItemSizeIndex;
    final currentItem = _items[index];
    final currentChosenSizeItem = currentItem.sizes[shoppingItemSizeIndex];
    currentItem.chosenSizeIndex = currentChosenSizeItem;
    notifyListeners();
  }

  int getSelectedShoppingItemSize(int index) {
    return _items[index].sizes[selectedShoppingItemSizeIndex];
  }

  void setShoppingItemRating(int index, double shoppingItemRating) {
    final currentItem = _items[index];
    currentItem.rating = shoppingItemRating;
    notifyListeners();
  }

  double getInitialShoppingItemRating(int index) {
    return _items[index].rating;
  }

  void setShoppingCategoryPosition(int position) {
    shoppingCategoryPosition = position;
    notifyListeners();
  }
}
