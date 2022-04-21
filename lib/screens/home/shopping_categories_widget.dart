import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../palette.dart';
import 'home.dart';
import 'home_provider.dart';

class ShoppingCategoriesWidget extends StatelessWidget {
  const ShoppingCategoriesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List categoryImages = [
      AssetImage('shopping_app_assets/wristwatch.png'),
      AssetImage('shopping_app_assets/tshirt.png'),
      AssetImage('shopping_app_assets/sneakers.png'),
      AssetImage('shopping_app_assets/school_bag.png'),
      AssetImage('shopping_app_assets/wristwatch.png'),
      AssetImage('shopping_app_assets/tshirt.png'),
      AssetImage('shopping_app_assets/sneakers.png'),
      AssetImage('shopping_app_assets/school_bag.png'),
    ];

    const List categoryIcons = [
      Icons.watch,
      Icons.shopping_bag,
      Icons.watch,
      Icons.shopping_bag,
      Icons.watch,
      Icons.shopping_bag,
      Icons.watch,
      Icons.shopping_bag,
      Icons.watch,
    ];

    return SizedBox(
      height: 40,
      child: Consumer<HomeProvider>(
        builder: (context, provider, _) => ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              child: (index == provider.shoppingCategoryPosition)
                  ? Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(8.0),
                      decoration:  const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Palette.primaryColor),
                      // child: ImageIcon(
                      //   categoryImages[index],
                      //   color: Colors.white,
                      //   size: 24,
                      // ),
                      child: Icon(
                        categoryIcons[index],
                        color: Colors.white,
                      ),
                    )
                  : Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Color(0xFFf4f0ec)),
                      child: Icon(
                        categoryIcons[index],
                        color: Colors.grey,
                      ),
                    ),
              onTap: () {
                provider.setShoppingCategoryPosition(index);
              },
            );
          },
          itemCount: categoryIcons.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 16);
          },
        ),
      ),
    );
  }
}
