import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/home/custom_drawer.dart'; // Update this import
import '../widgets/home/location_bar.dart';
import '../widgets/home/search_bar.dart';
import '../widgets/home/image_slider.dart';
import '../widgets/home/category_grid.dart';
import '../widgets/home/product_section.dart';
import '../widgets/back_to_top_button.dart'; // Import the new widget

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180.0), // Increased height for extended app bar
        child: Container(
          color: Colors.red,
          child: Column(
            children: [
              // AppBar section
              AppBar(
                backgroundColor: Colors.red,
                elevation: 0,
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  },
                ),
                title: const Text('Bite & Bliss'),
                actions: [
                  IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {

    // Navigate to category view
                    Navigator.pushNamed(
                          context,
                          AppRoutes.cart,
                        );
                      }),

                ],
              ),
              // LocationBar and SearchBar below the AppBar
              const LocationBar(),
              const CustomSearchBar(),
            ],
          ),
        ),
      ),
      drawer: const CustomDrawer(),

      body: Column(
        children: [
          // Scrollable content below the extended AppBar
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(

                children: [
                  const SizedBox(height:8,),
                  const ImageSlider(),
                  const SizedBox(height: 16), // Add spacing if necessary
                  const CategoryGrid(),
                  const SizedBox(height: 16), // Add spacing if necessary
                  const ProductSection(title: 'Salad'),
                  const SizedBox(height: 16), // Add spacing if necessary
                  const ProductSection(title: 'MOMO'),
                  const SizedBox(height: 16), // Add spacing if necessary
                  const ProductSection(title: 'BREAD & BUN'),
                  const SizedBox(height: 16), // Add spacing if necessary
                  const ProductSection(title: 'SWEET & DESSERT'),
                  const SizedBox(height: 16),
                  // Add "You have reached the bottom" text
                  const Text(
                    'You have reached to the bottom of page',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  // Add the BackToTopButton
                  BackToTopButton(onPressed: _scrollToTop),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(selectedIndex: 0),
    );
  }
}
