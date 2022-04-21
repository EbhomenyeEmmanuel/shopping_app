
import 'package:flutter/material.dart';

class ShoppingCartListView extends StatefulWidget {
  //final List<String> _sizesList;

  const ShoppingCartListView({
    Key? key,
  }) :
  //_sizesList = sizesList,
        super(key: key);

  @override
  State<ShoppingCartListView> createState() => _ShoppingCartListViewState();
}

class _ShoppingCartListViewState extends State<ShoppingCartListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        int noOfSimilarItemsInCart = 1;
        return InkWell(
          child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color(0xFFf4f0ec)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 55,
                      height: 70,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.white)),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Apple Watch Series 3",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "Size: 36",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "N140",
                              style: TextStyle(
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
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      color: Colors.deepOrangeAccent,
                                      onPressed: () {
                                        setState(() {
                                          if (noOfSimilarItemsInCart > 0) {
                                            --noOfSimilarItemsInCart;
                                          }
                                        });
                                      },
                                      icon: const Icon(Icons.remove),
                                    ),
                                    Text(
                                      "$noOfSimilarItemsInCart",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      color: Colors.deepOrangeAccent,
                                      onPressed: () {
                                        setState(() {
                                          ++noOfSimilarItemsInCart;
                                        });
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
          onTap: () {
            setState(() {});
          },
        );
      },
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16);
      },
    );
  }
}