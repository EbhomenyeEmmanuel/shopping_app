import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/shopping_item.dart';

import 'home.dart';

class ShoppingItemThumbnail extends StatelessWidget {
  final ShoppingItem _item;
  final int _itemIndex;

  const ShoppingItemThumbnail(
      {Key? key, required ShoppingItem item, required int itemIndex})
      : _item = item,
        _itemIndex = itemIndex,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO(Shopping Item not checked when item is clicked.)
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Expanded(child: ShoppingItemDetail(_item));
        }));
      },
      child: Consumer<HomeProvider>(
        builder: (context, provider, _) => Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Color(0xFFf4f0ec)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 16.0),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: Colors.white),
                      child: Text(
                        "${_item.discount}% OFF",
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite),
                      iconSize: 30,
                      color: provider.items[_itemIndex].isChecked
                          ? Colors.red
                          : Colors.grey,
                      onPressed: () {
                        final provider = Provider.of<HomeProvider>(context, listen: false);
                        provider.toggleFavoriteStatus(_itemIndex);
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                  child: SizedBox(
                height: 150,
                child: ClipRect(child: Image.asset(_item.images.first)),
              )),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _item.name,
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          _item.newPrice,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          _item.oldPrice,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
