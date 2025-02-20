import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/wishlist_provider.dart';
import '../models/product.dart';
import '../widgets/home/product_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlist'),
      ),
      body: wishlistProvider.wishlistItems.isEmpty
          ? const Center(
        child: Text('No items in your wishlist'),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: wishlistProvider.wishlistItems.length,
        itemBuilder: (context, index) {
          final product = wishlistProvider.wishlistItems[index];
          return ProductCard(
            product: product,
            onAddToCart: () {
              context.read<CartProvider>().addItem(
                productId: product.id,
                name: product.name,
                price: product.price,
                imageUrl: product.imageUrl,
              );
            },
          );
        },
      ),
    );
  }
}