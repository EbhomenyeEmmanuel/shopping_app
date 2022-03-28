import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShoppingItemThumbnail extends StatefulWidget {
  const ShoppingItemThumbnail({Key? key}) : super(key: key);

  @override
  State<ShoppingItemThumbnail> createState() => _ShoppingItemThumbnailState();
}

class _ShoppingItemThumbnailState extends State<ShoppingItemThumbnail> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Expanded(child: ShoppingItemDetail());
        }));
      },
      child: Container(
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
                    child: const Text(
                      "30% OFF",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    iconSize: 30,
                    color: _isFavorited ? Colors.red : Colors.grey,
                    onPressed: () {
                      setState(() {
                        _isFavorited = !_isFavorited;
                      });
                    },
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              height: 150,
              //child: ClipRect(child: Image.asset("shopping_app_assets/watch.webp")),
            )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Apple Watch - M2",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: const [
                      Text(
                        "N100",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "N130",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShoppingItemDetail extends StatefulWidget {
  const ShoppingItemDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<ShoppingItemDetail> createState() => _ShoppingItemDetailState();
}

class _ShoppingItemDetailState extends State<ShoppingItemDetail> {
  List<String> sizes = ['35', '36', '37', '38', '39', '40', '41', '42'];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
            child: Container(
              //height: screenSize.height * 0.4,
              width: screenSize.width,
            ),
          ),
          const Text(
            "Apple Watch Series 6",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
              const Text(
                "(4500 Reviews)",
                style: TextStyle(
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
            children: const [
              Text(
                "N140",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  "N200",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                ),
              ),
              Spacer(),
              Text(
                "Available in stock",
                style: TextStyle(
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
          const Text(
            "The watch I got was really beautifully and trendy. "
            "It was the Ben 10 watch, which I am very fond of. "
            "It is red in color and has beautiful Ben 10 pictures.",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(height: 41, child: ShoppingItemSizeListView(sizes)),
          const SizedBox(
            height: 24,
          ),
          MaterialButton(
            padding: const EdgeInsets.all(16),
            minWidth: screenSize.width,
            color: Colors.deepOrangeAccent,
            onPressed: () {},
            textColor: Colors.white,
            child: const Text("Add to cart"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    ));
  }
}

class ShoppingItemSizeListView extends StatefulWidget {
  final List<String> _sizesList;

  const ShoppingItemSizeListView(
    List<String> sizesList, {
    Key? key,
  })  : _sizesList = sizesList,
        super(key: key);

  @override
  State<ShoppingItemSizeListView> createState() =>
      _ShoppingItemSizeListViewState();
}

class _ShoppingItemSizeListViewState extends State<ShoppingItemSizeListView> {
  int clickedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          child: (index == clickedIndex)
              ? Container(
                  alignment: Alignment.center,
                  height: 41,
                  width: 40,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: Colors.orangeAccent.withOpacity(0.25)),
                  child: Text(
                    widget._sizesList[index],
                    style: const TextStyle(color: Colors.deepOrangeAccent),
                  ))
              : Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: Colors.grey.withOpacity(0.5)),
                  child: Container(
                      alignment: Alignment.center,
                      width: 40,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Color(0xFFf4f0ec)),
                      child: Text(
                        widget._sizesList[index],
                        style: const TextStyle(color: Colors.black),
                      )),
                ),
          onTap: () {
            setState(() {
              clickedIndex = index;
            });
          },
        );
      },
      itemCount: widget._sizesList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 16);
      },
    );
  }
}
