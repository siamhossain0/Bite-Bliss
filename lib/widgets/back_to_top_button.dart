import 'package:flutter/material.dart';

class BackToTopButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BackToTopButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red, // Red background
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        ),
        child: const Text(
          'BACK TO TOP',
          style: TextStyle(
            color: Colors.white, // White text color
            fontSize: 16, // Font size
            fontWeight: FontWeight.bold, // Bold text
          ),
        ),
      ),
    );
  }
}
