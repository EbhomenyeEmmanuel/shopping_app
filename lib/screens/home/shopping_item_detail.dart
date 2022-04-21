import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/cart_item.dart';
import 'package:shopping_app/models/shopping_item.dart';

import '../cart/cart_provider.dart';
import '../palette.dart';
import 'home.dart';

class ShoppingItemDetail extends StatefulWidget {
  final ShoppingItem _item;

  const ShoppingItemDetail(
    ShoppingItem item, {
    Key? key,
  })  : _item = item,
        super(key: key);

  @override
  State<ShoppingItemDetail> createState() => _ShoppingItemDetailState();
}

class _ShoppingItemDetailState extends State<ShoppingItemDetail> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final item = widget._item;
    //dynamic _ratingValue;
    //Use an hashmap to store the five states of the Star IconButton

    return Scaffold(
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
              child: ClipRect(child: Image.asset(item.images.first)),
              width: screenSize.width,
            ),
          ),
          Text(
            item.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              RatingBar(
                  initialRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ratingWidget: RatingWidget(
                      full: const Icon(Icons.star, color: Colors.orange),
                      half: const Icon(
                        Icons.star_half,
                        color: Colors.orange,
                      ),
                      empty: const Icon(
                        Icons.star_outline,
                        color: Colors.orange,
                      )),
                  onRatingUpdate: (value) {
                    setState(() {
                      //_ratingValue = value;
                    });
                  }),
              Text(
                "(${item.noOfReviews} Reviews)",
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
                item.newPrice,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  item.oldPrice,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                ),
              ),
              const Spacer(),
              Text(
                item.availabilityDescription,
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
            item.description,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(height: 41, child: ShoppingItemSizeListView(item.sizes)),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 10),
            child: MaterialButton(
              padding: const EdgeInsets.all(16),
              minWidth: screenSize.width,
              color: Palette.primaryColor,
              onPressed: () {
                Provider.of<ShoppingCartProvider>(context, listen: false).add(
                    CartItem(
                        id: item.id,
                        image: item.images.first,
                        name: item.name,
                        price: item.newPrice,
                        description: item.description,
                        size: 20,
                        noOfItems: 1));
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
    ));
  }
}
