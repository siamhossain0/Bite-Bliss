import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/product_data.dart';
import '../../providers/cart_provider.dart';
import '../../widgets/home/product_card.dart';
import '../../routes/app_routes.dart';
class ProductSection extends StatelessWidget {
  final String title;

  const ProductSection({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsData>(
      builder: (context, productsData, child) {
        final products = productsData.getProductsByCategory(title);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to category view
                      Navigator.pushNamed(
                        context,
                        AppRoutes.category,

                      );
                    },
                    child: const Text(
                      'VIEW ALL',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ProductCard(
                      product: product,
                      onAddToCart: () {
                        if (!product.isAvailable) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Sorry, this item is out of stock'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return;
                        }

                        // Add to cart using CartProvider
                        context.read<CartProvider>().addItem(
                          productId: product.id,
                          name: product.name,
                          price: product.price,
                          imageUrl: product.imageUrl,
                        );
                        // Show success message with cart action
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added ${product.name} to cart'),
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'VIEW CART',
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.cart);
                              },
                            ),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.all(8),
                          ),
                        );

                        // Optional: Add haptic feedback

                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}