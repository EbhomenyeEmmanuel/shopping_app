import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/cart_item.dart';
import 'package:shopping_app/models/shopping_item.dart';

import '../cart/cart_provider.dart';
import '../palette.dart';
import 'home.dart';

class ShoppingItemDetail extends StatelessWidget {
  final ShoppingItem _item;
  final int _index;

  const ShoppingItemDetail(
    ShoppingItem item,
    int index, {
    Key? key,
  })  : _item = item,
        _index = index,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    //dynamic _ratingValue;
    //Use an hashmap to store the five states of the Star IconButton
    return Consumer<HomeProvider>(
        builder: (context, provider, _) => Scaffold(
                body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    padding: const EdgeInsets.only(top: 16),
                    alignment: Alignment.centerLeft,
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: SizedBox(
                      //TODO(Replace with carousel)
                      //height: screenSize.height * 0.4,
                      child: ClipRect(child: Image.asset(_item.images.first)),
                      width: screenSize.width,
                    ),
                  ),
                  Text(
                    _item.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      RatingBar(
                          initialRating: provider.getInitialShoppingItemRating(_index),
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                              full:
                                  const Icon(Icons.star, color: Colors.orange),
                              half: const Icon(
                                Icons.star_half,
                                color: Colors.orange,
                              ),
                              empty: const Icon(
                                Icons.star_outline,
                                color: Colors.orange,
                              )),
                          onRatingUpdate: (value) {
                            Provider.of<HomeProvider>(context, listen: false).setShoppingItemRating(_index, value);
                          }),
                      Text(
                        "(${_item.noOfReviews} Reviews)",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _item.newPrice,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          _item.oldPrice,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        _item.availabilityDescription,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "About",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    _item.description,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 41,
                      child: ShoppingItemSizeListView(_item.sizes, _index)),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 10),
                    child: MaterialButton(
                      padding: const EdgeInsets.all(16),
                      minWidth: screenSize.width,
                      color: Palette.primaryColor,
                      onPressed: () async {
                        Provider.of<ShoppingCartProvider>(context, listen: false).add(CartItem(
                          id: _item.id,
                          image: _item.images.first,
                          name: _item.name,
                          price: _item.newPrice,
                          description: _item.description,
                          size: provider.getSelectedShoppingItemSize(_index),
                        ));
                        await Future.delayed(const Duration(seconds: 2));
                        Navigator.pop(context);
                      },
                      textColor: Colors.white,
                      child: const Text("Add to cart"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
