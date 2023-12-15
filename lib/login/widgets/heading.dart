import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(24, 48, 24, 24),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Вход',
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(43, 45, 51, 1),
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Введите данные для входа',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(135, 153, 165, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
