import 'package:flutter/material.dart';

class CustomDrawerListItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback onTap;

  const CustomDrawerListItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 24,
        height: 24,
        child: icon,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      minLeadingWidth: 24,
      horizontalTitleGap: 16,
    );
  }
}