import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/recent_products/recent_products_bloc.dart';
import '../models/product.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchHeader(context),
            _buildScanningOptions(),
            Expanded(child: _buildRecentProducts()), // Adjust for proper layout
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(selectedIndex: 1),
    );
  }

  Widget _buildSearchHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () =>Navigator.popAndPushNamed(context, '/home'),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search Products',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.mic),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildScanningOptions() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Search By Scanning',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildScanOption(
                  icon: 'assets/icons/scan_image.png',
                  title: 'Scan with Image',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildScanOption(
                  icon: 'assets/icons/scan_text.png',
                  title: 'Scan with Text',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecentProducts() {
    return BlocBuilder<RecentProductsBloc, RecentProductsState>(
      builder: (context, state) {
        if (state is RecentProductsLoaded && state.products.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'RECENT VIEW PRODUCTS',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return _buildRecentProductCard(product);
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildScanOption({required String icon, required String title}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.image, size: 20), // Placeholder icon
          const SizedBox(width: 8),
          Text(title),
        ],
      ),
    );
  }


  Widget _buildRecentProductCard(Product product) {
    return Container(
      width: 100, // Reduced width to prevent overflow
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            product.imageUrl,
            height: 80, // Adjusted height for proper scaling
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
