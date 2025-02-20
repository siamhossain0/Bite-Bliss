class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final double rating;
  final bool isAvailable;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.rating = 0.0,
    this.isAvailable = true,
    this.isFavorite = false,
  });
} 