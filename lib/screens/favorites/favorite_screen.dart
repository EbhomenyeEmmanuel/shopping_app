import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screens/favorites/favorite_provider.dart';

import '../shared/shopping_list_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
        builder: (context, favoriteProvider, child) => Padding(
            padding: const EdgeInsets.all(16),
            child: Visibility(
              visible: favoriteProvider.favoriteItems.isNotEmpty,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text("Favorites ",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                      child:
                          ShoppingListWidget(favoriteProvider.favoriteItems)),
                ],
              ),
              replacement: const Center(
                child: Text("No favorite Items yet :( ",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
            )));
  }
}
