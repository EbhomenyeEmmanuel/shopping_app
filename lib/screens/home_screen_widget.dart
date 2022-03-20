import 'package:flutter/material.dart';
import 'package:shopping_app/components/components.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 8),
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
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            constraints: BoxConstraints.expand(
                width: screenSize.width, height: screenSize.height * 0.2),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.deepOrangeAccent),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "30% OFF DURING",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "COVID 19",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 16.0),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Colors.white),
                    child: Text(
                      "Get Now",
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Top Categories",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              const Text("SEE ALL",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(child: ShoppingCategoriesWidget()),
          Expanded(child: ShoppingListWidget()),
        ],
      ),
    ));
  }
}

class ShoppingListWidget extends StatelessWidget {
  const ShoppingListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
      itemBuilder: (context, index) {
        return const ShoppingItemThumbnail();
      },
      itemCount: 4,
    );
  }
}

class ShoppingCategoriesWidget extends StatefulWidget {
  const ShoppingCategoriesWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ShoppingCategoriesWidget> createState() =>
      _ShoppingCategoriesWidgetState();
}

class _ShoppingCategoriesWidgetState extends State<ShoppingCategoriesWidget> {
  int clickedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          child: (index == clickedIndex)
              ? Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Colors.deepOrangeAccent),
                  child: const Icon(
                    Icons.accessibility,
                    color: Colors.white,
                  ),
                )
              : Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      color: Colors.grey.withOpacity(0.2)),
                  child: const Icon(
                    Icons.accessibility,
                    color: Colors.grey,
                  ),
                ),
          onTap: () {
            setState(() {
              clickedIndex = index;
            });
          },
        );
      },
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: 16);
      },
    );
  }
}
