import 'package:flutter/material.dart';

class Place extends StatelessWidget {
  const Place({super.key, required this.displayAddress});

  final String displayAddress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          const ImageIcon(
            AssetImage('assets/icons/pin.png'),
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Text(
            displayAddress,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
