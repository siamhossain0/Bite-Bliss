import 'package:flutter/foundation.dart';
import '../models/product.dart';

class WishlistProvider with ChangeNotifier {
  final List<Product> _wishlistItems = [];

  List<Product> get wishlistItems => _wishlistItems;

  void addToWishlist(Product product) {
    if (!_wishlistItems.any((item) => item.id == product.id)) {
      _wishlistItems.add(product);
      notifyListeners();
    }
  }

  void removeFromWishlist(String productId) {
    _wishlistItems.removeWhere((item) => item.id == productId);
    notifyListeners();
  }

  bool isProductInWishlist(String productId) {
    return _wishlistItems.any((item) => item.id == productId);
  }
}