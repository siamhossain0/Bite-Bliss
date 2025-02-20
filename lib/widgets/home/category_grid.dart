import 'package:flutter/material.dart';
class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});
  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'Cakes', 'images': 'assets/images/cake1.png'},
      {'name': 'Pastry', 'images': 'assets/images/Pastry.png'},
      {'name': 'Dessert & Sweets', 'images': 'assets/images/sweet.jpeg'},
      {'name': 'Pizza', 'images': 'assets/images/pizzaaa.jpg'},
      {'name': 'Tacos', 'images': 'assets/images/tacos.png'},
      {'name': 'Burger', 'images': 'assets/images/burger2.png'},
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40, // Adjust the radius as needed
                    backgroundImage: AssetImage(category['images']!),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category['name']!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
