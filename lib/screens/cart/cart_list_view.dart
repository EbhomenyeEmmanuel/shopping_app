import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/cart_item.dart';

import 'cart.dart';

class ShoppingCartListView extends StatelessWidget {
  final List<CartItem> _cartItems;

  const ShoppingCartListView(
    List<CartItem> cartItems, {
    Key? key,
  })  : _cartItems = cartItems,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return ShoppingCartItemThumbnail(
          item: _cartItems[index],
          itemIndex: index,
        );
      },
      itemCount: _cartItems.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16);
      },
    );
  }
}
