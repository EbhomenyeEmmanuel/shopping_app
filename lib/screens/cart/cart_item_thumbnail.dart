import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/cart_item.dart';

import '../palette.dart';
import 'cart.dart';

class ShoppingCartItemThumbnail extends StatelessWidget {
  final CartItem _item;
  final int _itemIndex;

  const ShoppingCartItemThumbnail(
      {Key? key, required CartItem item, required int itemIndex})
      : _item = item,
        _itemIndex = itemIndex,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCartProvider>(
      builder: (context, provider, _) => Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Palette.cartItemBackgroundColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CartItemThumbnailIcon(image: _item.image),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _item.name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Size: ${_item.size}",
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "N${_item.price}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          height: 30,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  color: Colors.deepOrangeAccent,
                                  onPressed: () {
                                    provider
                                        .decrementNoOfItemsInCart(_itemIndex);
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Text(
                                  "${_item.noOfItems}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  color: Colors.deepOrangeAccent,
                                  onPressed: () {
                                    provider
                                        .incrementNoOfItemsInCart(_itemIndex);
                                  },
                                  icon: const Icon(Icons.add),
                                )
                              ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 4,
              ),
            ],
          )),
    );
  }
}
