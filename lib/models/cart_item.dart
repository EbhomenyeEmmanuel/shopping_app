
class CartItem {
  final int id;
  final String image;
  final String name;
  final String price;
  final String description;
  final int size;
  int noOfItems;

  CartItem(
      {required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.description,
      required this.size,
      required this.noOfItems});
}
