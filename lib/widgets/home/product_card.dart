import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../../providers/cart_provider.dart';
import '../../providers/product_data.dart';
import '../../providers/wishlist_provider.dart';
import '../../routes/app_routes.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final void Function() onAddToCart;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = context.watch<WishlistProvider>();
    final isFavorite = wishlistProvider.isProductInWishlist(product.id);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: SizedBox(
        width: 150,
        height: 250,
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipOval(
                    child: Image.asset(
                      product.imageUrl,
                      height: 110,
                      width: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: IconButton(
                        iconSize: 20,
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: product.isFavorite ? Colors.red : null,
                        ),
                        onPressed: () {
                          final productsData =
                              Provider.of<ProductsData>(context, listen: false);
                          productsData.toggleFavoriteStatus(product.id);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          product.rating.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    Text(
                      '৳${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<CartProvider>().addItem(
                                productId: product.id,
                                name: product.name,
                                price: product.price,
                                imageUrl: product.imageUrl,
                              );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Item added to cart'),
                              duration: const Duration(seconds: 2),
                              action: SnackBarAction(
                                label: 'VIEW CART',
                                onPressed: () {
                                  Navigator.pushNamed(context, AppRoutes.cart);
                                },
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
