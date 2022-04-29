
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import 'home_provider.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    Key? key,
    required int index,
  })  : _index = index,
        super(key: key);

  final int _index;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (context, provider, _) => RatingBar(
            initialRating: provider.getInitialShoppingItemRating(_index),
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
              Provider.of<HomeProvider>(context, listen: false)
                  .setShoppingItemRating(_index, value);
            }));
  }
}