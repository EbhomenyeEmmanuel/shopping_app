import 'package:flutter/material.dart';

class ShoppingItemThumbnail extends StatefulWidget {
  const ShoppingItemThumbnail({Key? key}) : super(key: key);

  @override
  State<ShoppingItemThumbnail> createState() => _ShoppingItemThumbnailState();
}

class _ShoppingItemThumbnailState extends State<ShoppingItemThumbnail> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: Colors.grey.withOpacity(0.2)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 16.0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Colors.white),
                  child: Text(
                    "30% OFF",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: Icon(
                      _isFavorited ? Icons.favorite : Icons.favorite_border),
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
        ],
      ),
    );
  }
}
