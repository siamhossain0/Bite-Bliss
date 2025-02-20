// lib/widgets/home/custom_drawer.dart
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import 'drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Custom Drawer Header
          const CustomDrawerHeader(),

          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Text(
                      'ACCOUNT',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  _buildMenuItem(
                    icon: Icons.favorite_outline,
                    title: 'My Wishlist',
                    onTap: (){
                      Navigator.pushNamed(context, AppRoutes.wishlist);
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.location_on_outlined,
                    title: 'Track Order',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.shopping_bag_outlined,
                    title: 'My Orders',
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.order);
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.local_offer_outlined,
                    title: 'Promotions',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.store_outlined,
                    title: 'Our outlets',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.description_outlined,
                    title: 'Terms And Conditions',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.mail_outline,
                    title: 'Contact Us',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.red[900],
        size: 24,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      minLeadingWidth: 24,
      horizontalTitleGap: 16,
    );
  }
}