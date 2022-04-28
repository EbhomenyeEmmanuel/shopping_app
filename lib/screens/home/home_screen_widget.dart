import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../palette.dart';
import '../shared/shopping_list_widget.dart';
import 'home.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) => Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.ac_unit,
                  color: Colors.black,
                ),
                Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            const Text("Hello Rocky :)",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 4,
            ),
            const Text(
              "Let's gets somethings?",
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const ShoppingAdvertListView(),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Top Categories",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text("SEE ALL",
                    style: TextStyle(
                        fontSize: 14,
                        color: Palette.primaryColor,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const ShoppingCategoriesWidget(),
            Expanded(child: ShoppingListWidget(homeProvider.items)),
          ],
        ),
      )),
    );
  }
}
