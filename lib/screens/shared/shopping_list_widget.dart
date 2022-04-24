import 'package:flutter/material.dart';
import 'package:shopping_app/models/shopping_item.dart';

import '../home/shopping_item_thumbnail.dart';

class ShoppingListWidget extends StatelessWidget {
  final List<ShoppingItem> _items;

  const ShoppingListWidget(
    List<ShoppingItem> items, {
    Key? key,
  })  : _items = items,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
      itemBuilder: (context, index) {
        return ShoppingItemThumbnail(
          item: _items[index],
          itemIndex: index,
        );
      },
      itemCount: _items.length,
    );
  }
}
