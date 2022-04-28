class ShoppingItem {
  final int id;
  final List<String> images;
  final String name;
  final int noOfReviews;
  final String newPrice;
  final String oldPrice;
  final String availabilityDescription;
  final String description;
  final int discount;
  final List<int> sizes;
  bool isChecked;
  int chosenSizeIndex;
  double rating;

  ShoppingItem(
      {required this.id,
      required this.images,
      required this.name,
      required this.noOfReviews,
      required this.newPrice,
      required this.oldPrice,
      required this.availabilityDescription,
      required this.description,
      required this.discount,
      required this.sizes,
      this.isChecked = false,
      this.chosenSizeIndex = 0,
      this.rating = 0});
}
