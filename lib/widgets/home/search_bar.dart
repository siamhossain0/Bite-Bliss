import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),

      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search Products',
          border: InputBorder.none,
          icon: Icon(Icons.search),
          suffixIcon: Icon(Icons.mic),
        ),
      ),
    );
  }
}