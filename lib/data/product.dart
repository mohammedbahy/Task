class Product {
  final String image;
  final String name;
  final double price;
  final double rating;
  final bool isFavorite;

  const Product({
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
    this.isFavorite = false,
  });
}