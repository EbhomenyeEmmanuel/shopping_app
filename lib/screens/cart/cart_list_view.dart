import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class ShoppingCartListView extends StatelessWidget {
  const ShoppingCartListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCartProvider>(
        builder: (context, provider, _) => ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ShoppingCartItemThumbnail(
                    item: provider.populatedCartItems[index], itemIndex: index,);
              },
              itemCount: provider.populatedCartItems.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
            ));
  }
}
