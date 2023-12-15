import 'package:flutter/material.dart';

class MainInfo extends StatelessWidget {
  const MainInfo({
    super.key,
    required this.currentTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.condition,
  });

  final int currentTemp, minTemp, maxTemp;
  final String condition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(150)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(189, 135, 255, 1),
                    spreadRadius: 5,
                    blurRadius: 70,
                  ),
                ]),
            child: Image.asset(
              'assets/weather_icons_big/$condition.png',
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.question_mark,
                size: 180,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Text(
          '$currentTemp°',
          style: const TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 64,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        Text(
          condition.toRussian,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Макс.: $maxTemp° Мин: $minTemp°',
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

extension ConditionExtension on String {
  String get toRussian {
    switch (this) {
      case 'Thunderstorm':
        return 'Гроза';
      case 'Drizzle':
        return 'Морось';
      case 'Rain':
        return 'Дождь';
      case 'Snow':
        return 'Снег';
      case 'Clear':
        return 'Ясно';
      case 'Clouds':
        return 'Облачно';
      default:
        return 'Неизвестно';
    }
  }
}
