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
  final List<String> sizes;
  bool isChecked;

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
      required this.isChecked});
}
