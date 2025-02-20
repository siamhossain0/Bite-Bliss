import 'package:flutter/foundation.dart';
import '../models/cart_items.dart';


class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

    int get itemCount {
    int count = 0;
    _items.forEach((key, item) {
      count += item.quantity;
    });
    return count;
  }


  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, item) {
      total += item.price * item.quantity;
    });
    return total;
  }

  double get shippingFee => 50.0; // Example fixed shipping fee
  double get discount => 0.0; // Implement discount logic as needed
  double get grandTotal => totalAmount + shippingFee - discount;

  void addItem({
    required String productId,
    required String name,
    required double price,
    required String imageUrl,
  }) {
    if (_items.containsKey(productId)) {
      // Increase quantity if item exists
      _items.update(
        productId,
            (existingItem) => CartItem(
          id: existingItem.id,
          name: existingItem.name,
          price: existingItem.price,
          quantity: existingItem.quantity + 1,
          imageUrl: existingItem.imageUrl,
        ),
      );
    } else {
      // Add new item
      _items.putIfAbsent(
        productId,
            () => CartItem(
          id: productId,
          name: name,
          price: price,
          quantity: 1,
          imageUrl: imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void incrementQuantity(String productId) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
            (existingItem) => CartItem(
          id: existingItem.id,
          name: existingItem.name,
          price: existingItem.price,
          quantity: existingItem.quantity + 1,
          imageUrl: existingItem.imageUrl,
        ),
      );
      notifyListeners();
    }
  }

  void decrementQuantity(String productId) {
    if (!_items.containsKey(productId)) return;

    if (_items[productId]!.quantity > 1) {
      _items.update(
        productId,
            (existingItem) => CartItem(
          id: existingItem.id,
          name: existingItem.name,
          price: existingItem.price,
          quantity: existingItem.quantity - 1,
          imageUrl: existingItem.imageUrl,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}