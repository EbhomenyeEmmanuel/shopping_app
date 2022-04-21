import 'package:flutter/material.dart';

import 'shopping_item_thumbnail.dart';

class ShoppingListWidget extends StatelessWidget {
  const ShoppingListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
      itemBuilder: (context, index) {
        return const ShoppingItemThumbnail();
      },
      itemCount: 4,
    );
  }
}
