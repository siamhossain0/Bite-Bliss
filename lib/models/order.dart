
import 'cart_items.dart';

class Order {
  final String id;
  final List<CartItem> items;
  final double totalAmount;
  final DateTime orderDate;
  final String status;
  final String trackingNumber;

  Order({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    this.status = 'Processing',
    this.trackingNumber = '',
  });
}