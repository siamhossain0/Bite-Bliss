import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final int imageIndex;

  const CategoryItem({
    super.key,
    required this.title,
    required this.imageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/category_$imageIndex.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
