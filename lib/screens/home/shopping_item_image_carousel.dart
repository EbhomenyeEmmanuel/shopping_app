
import 'package:flutter/material.dart';

import '../../models/shopping_item.dart';

class ShoppingItemImageCarousel extends StatelessWidget {
  const ShoppingItemImageCarousel({
    Key? key,
    required ShoppingItem item,
    required this.screenSize,
  }) : _item = item, super(key: key);

  final ShoppingItem _item;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //TODO(Replace with carousel)
      //height: screenSize.height * 0.4,
      child: ClipRect(child: Image.asset(_item.images.first)),
      width: screenSize.width,
    );
  }
}
