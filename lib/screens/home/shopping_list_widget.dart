import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screens/home/home_provider.dart';

import 'shopping_item_thumbnail.dart';

class ShoppingListWidget extends StatelessWidget {
  const ShoppingListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (context, homeProvider, child) => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
              itemBuilder: (context, index) {
                return ShoppingItemThumbnail(
                  item: homeProvider.items[index],
                  itemIndex: index,
                );
              },
              itemCount: homeProvider.items.length,
            ));
  }
}
