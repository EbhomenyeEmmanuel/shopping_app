import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screens/cart/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Consumer<ShoppingCartProvider>(builder: (context, provider, _) {
      provider.calculateTotalPrice();
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "My Cart",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Visibility(
              visible: provider.cartItems.isNotEmpty,
              child: Column(
                children: [
                  Expanded(child: ShoppingCartListView(provider.cartItems)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "N${provider.totalPrice}",
                        style: const TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: MaterialButton(
                      padding: const EdgeInsets.all(16),
                      minWidth: screenSize.width,
                      color: Colors.deepOrangeAccent,
                      onPressed: () {
                        provider.payForItemsInCart();
                      },
                      textColor: Colors.white,
                      child: const Text("Buy Now"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),
                ],
              ),
              replacement: const Center(
                child: Text("No Items in Cart yet :( ",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
            )),
      );
    });
  }
}
