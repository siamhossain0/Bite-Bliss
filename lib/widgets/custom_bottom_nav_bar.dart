import 'package:flutter/material.dart';
import '../screens/category_screen.dart';
import '../screens/home_screen.dart'; // Adjust the import paths based on your folder structure
import '../screens/cart_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_page.dart';


class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavBar({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.red, // Color for the selected item
      unselectedItemColor: Colors.grey, // Color for unselected items
      currentIndex: selectedIndex, // Highlight the selected tab
      onTap: (index) {
        // Handle navigation
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SearchPage()),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CategoryScreen()),
            );
            break;
          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
            break;
          case 4:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
            break;
          default:
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
