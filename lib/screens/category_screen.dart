import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class CategoryScreen extends StatelessWidget {
  final List<String> categories = [
    'Cakes',
    'Pastry',
    'Fast food & Snacks',
    'Dessert & Sweets',
    'Bread & Bun',
    'Beverage',
    'Cookies & Toast',
    'Customized Cake',
    'Combo Meal',
  ];

  CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.popAndPushNamed(context, AppRoutes.home),
        ),
        title: const Text('Categories', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cart);
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: categories.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              categories[index],
              style: const TextStyle(fontSize: 16),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              switch (categories[index]) {
                case 'Cakes':
                  Navigator.pushNamed(context, AppRoutes.cakesPage);
                  break;
                case 'Pastry':
                  Navigator.pushNamed(context, AppRoutes.pastryPage);
                  break;
                case 'Fast food & Snacks':
                  Navigator.pushNamed(context, AppRoutes.fastFoodPage);
                  break;
                case 'Dessert & Sweets':
                  Navigator.pushNamed(context, AppRoutes.dessertPage);
                  break;
                case 'Bread & Bun':
                  Navigator.pushNamed(context, AppRoutes.breadPage);
                  break;
                case 'Beverage':
                  Navigator.pushNamed(context, AppRoutes.beveragePage);
                  break;
                case 'Cookies & Toast':
                  Navigator.pushNamed(context, AppRoutes.cookiesPage);
                  break;
                case 'Combo Meal':
                  Navigator.pushNamed(context, AppRoutes.comboMealPage);
                  break;

              }
            },
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(selectedIndex: 2),
    );
  }
}
