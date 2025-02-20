// providers/orders_provider.dart
import 'package:flutter/foundation.dart';
import '../models/cart_items.dart';
import '../models/order.dart';


class OrdersProvider with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => [..._orders];

  void addOrder(List<CartItem> cartItems, double total) {
    _orders.insert(
      0,
      Order(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        items: List.from(cartItems),
        totalAmount: total,
        orderDate: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}