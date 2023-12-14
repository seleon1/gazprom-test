import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Вход'),
        Text('Введите данные для входа'),
      ],
    );
  }
}
