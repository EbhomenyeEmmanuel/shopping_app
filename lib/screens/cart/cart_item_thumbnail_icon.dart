import 'package:flutter/material.dart';

class CartItemThumbnailIcon extends StatelessWidget {
  final String _image;

  const CartItemThumbnailIcon({Key? key, required String image})
      : _image = image,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 70,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Image.asset(_image),
    );
  }
}
