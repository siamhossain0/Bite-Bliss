import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../models/product.dart';
import 'wishlist_provider.dart';

class ProductsData with ChangeNotifier {
  final Map<String, List<Product>> _productsByCategory = {
    'Salad': [
      Product(
        id: 's1',
        name: 'Greek salad',
        price: 199.00,
        imageUrl: 'assets/images/salad.png',
        rating: 4.5,
        category: 'Salad',
      ),
      Product(
        id: 's2',
        name: 'Mixed Salad',
        price: 199.99,
        imageUrl: 'assets/images/salad2.jpeg',
        rating: 2,
        category: 'Salad',
      ),
      Product(
        id: 's3',
        name: 'Tuna Salad',
        price: 199.99,
        imageUrl: 'assets/images/salad5.jpeg',
        rating: 4.5,
        category: 'Salad',
      ),
      Product(
        id: 's4',
        name: 'Chicken Salad',
        price: 199.99,
        imageUrl: 'assets/images/salad3.jpeg',
        rating: 4.5,
        category: 'Salad',
      ),
    ],
    'MOMO': [
      Product(
        id: 'm1',
        name: 'Chicken Momo',
        price: 249.99,
        imageUrl: 'assets/images/momo4.avif',
        rating: 4.8,
        category: 'MOMO',
      ),
      Product(
        id: 'm2',
        name: 'Chicken Momo',
        price: 249.99,
        imageUrl: 'assets/images/momo3.avif',
        rating: 4.8,
        category: 'MOMO',
      ),
      Product(
        id: 'm3',
        name: 'Chicken Momo',
        price: 249.99,
        imageUrl: 'assets/images/momo2.jpeg',
        rating: 4.8,
        category: 'MOMO',
      ),
    ],
    'BREAD & BUN': [
      Product(
        id: 'b1',
        name: 'Whole Wheat Bread',
        price: 99.99,
        imageUrl: 'assets/images/bread1.jpeg',
        rating: 4.2,
        category: 'BREAD & BUN',
      ),
      Product(
        id: 'b2',
        name: 'Whole Wheat Bread',
        price: 99.99,
        imageUrl: 'assets/images/bread4.jpg',
        rating: 4.2,
        category: 'BREAD & BUN',
      ),
      Product(
        id: 'b3',
        name: 'Whole Wheat Bread',
        price: 99.99,
        imageUrl: 'assets/images/bread3.jpg',
        rating: 4.2,
        category: 'BREAD & BUN',
      ),
    ],
    'SWEET & DESSERT': [
      Product(
        id: 'd1',
        name: 'Chocolate Cake',
        price: 299.99,
        imageUrl: 'assets/images/sweet1.jpeg',
        rating: 4.9,
        category: 'SWEET & DESSERT',
      ),
      Product(
        id: 'd2',
        name: 'Chocolate Cake',
        price: 299.99,
        imageUrl: 'assets/images/sweet2.jpg',
        rating: 4.9,
        category: 'SWEET & DESSERT',
      ),
      Product(
        id: 'd3',
        name: 'Chocolate Cake',
        price: 299.99,
        imageUrl: 'assets/images/sweet3.jpg',
        rating: 4.9,
        category: 'SWEET & DESSERT',
      ),
      Product(
        id: 'd4',
        name: 'Chocolate Cake',
        price: 299.99,
        imageUrl: 'assets/images/sweet5.jpg',
        rating: 4.9,
        category: 'SWEET & DESSERT',
      ),
    ],
  };

  final WishlistProvider wishlistProvider;

  ProductsData(this.wishlistProvider);

  List<Product> getProductsByCategory(String category) {
    return _productsByCategory[category] ?? [];
  }

  void addProduct(Product product) {
    if (!_productsByCategory.containsKey(product.category)) {
      _productsByCategory[product.category] = [];
    }
    _productsByCategory[product.category]!.add(product);
    notifyListeners();
  }

  void removeProduct(String category, String productId) {
    if (_productsByCategory.containsKey(category)) {
      _productsByCategory[category]!.removeWhere((product) => product.id == productId);
      notifyListeners();
    }
  }

  void updateProduct(String category, Product updatedProduct) {
    if (_productsByCategory.containsKey(category)) {
      final index = _productsByCategory[category]!
          .indexWhere((product) => product.id == updatedProduct.id);
      if (index != -1) {
        _productsByCategory[category]![index] = updatedProduct;
        notifyListeners();
      }
    }
  }

  List<String> get categories => _productsByCategory.keys.toList();

  List<Product> get allProducts =>
      _productsByCategory.values.expand((products) => products).toList();

  void toggleFavoriteStatus(String productId) {
    for (var category in _productsByCategory.keys) {
      final products = _productsByCategory[category]!;
      for (var i = 0; i < products.length; i++) {
        if (products[i].id == productId) {
          products[i].isFavorite = !products[i].isFavorite;
          if (products[i].isFavorite) {
            wishlistProvider.addToWishlist(products[i]);
          } else {
            wishlistProvider.removeFromWishlist(productId);
          }
          notifyListeners();
          return;
        }
      }
    }
  }
}
