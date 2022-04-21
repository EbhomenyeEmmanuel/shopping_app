import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screens/home/home_provider.dart';
import 'package:shopping_app/screens/palette.dart';

class ShoppingItemSizeListView extends StatelessWidget {
  final List<String> _sizesList;

  const ShoppingItemSizeListView(
    List<String> sizesList, {
    Key? key,
  })  : _sizesList = sizesList,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) => ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            child: (index == provider.shoppingItemSize)
                ? Container(
                    alignment: Alignment.center,
                    height: 41,
                    width: 40,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: Palette.primaryColor.withOpacity(0.5)),
                    child: Text(
                      _sizesList[index],
                      style: const TextStyle(color: Palette.primaryColor),
                    ))
                : Container(
                    alignment: Alignment.center,
                    width: 40,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: const Color(0xFFf4f0ec)),
                    child: Text(
                      _sizesList[index],
                      style: const TextStyle(color: Colors.black),
                    )),
            onTap: () {
              provider.setShoppingItemSize(index);
            },
          );
        },
        itemCount: _sizesList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 16);
        },
      ),
    );
  }
}
