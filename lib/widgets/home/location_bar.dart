import 'package:flutter/material.dart';

class LocationBar extends StatelessWidget {
  const LocationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: Colors.red,
      child: const Row(
        children: [
          Icon(Icons.location_on, color: Colors.white),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Bite & Bliss -SS Road, Sirajganj',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Icon(Icons.keyboard_arrow_down, color: Colors.white),
        ],
      ),
    );
  }
}
