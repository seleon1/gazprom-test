import 'package:flutter/material.dart';

class AdditionalInfoRow extends StatelessWidget {
  const AdditionalInfoRow({
    super.key,
    required this.value,
    required this.title,
    required this.iconPath,
  });

  final String value, title, iconPath;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 100,
        child: Row(children: [
          ImageIcon(
            AssetImage(iconPath),
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ]),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}
