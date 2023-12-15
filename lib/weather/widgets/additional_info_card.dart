import 'package:flutter/material.dart';
import 'package:gazprom_test/weather/widgets/widgets.dart';

class AdditionalInfoCard extends StatelessWidget {
  const AdditionalInfoCard({
    super.key,
    required this.windSpeed,
    required this.windDegrees,
    required this.humidity,
  });

  final int windSpeed, windDegrees, humidity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Card(
        color: const Color.fromRGBO(255, 255, 255, 0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            AdditionalInfoRow(
              value: '$windSpeed м/с',
              title: 'Ветер ${windDegrees.windDirection}',
              iconPath: 'assets/icons/wind.png',
            ),
            AdditionalInfoRow(
              value: '$humidity%',
              title: humidity.humidityLevel,
              iconPath: 'assets/icons/drop.png',
            ),
          ],
        ),
      ),
    );
  }
}

extension NumbersToText on int {
  String get windDirection {
    if (this > 0 && this <= 90) {
      return 'северо-восточный';
    }
    if (this > 90 && this <= 180) {
      return 'юго-восточный';
    }
    if (this > 180 && this <= 270) {
      return 'юго-западный';
    }
    if (this > 270 && this <= 360) {
      return 'северо-западный';
    }
    return 'неизвестный';
  }

  String get humidityLevel {
    if (this > 0 && this <= 35) {
      return 'Cухой воздух';
    }
    if (this > 35 && this <= 60) {
      return 'Оптимальная влажность';
    }
    if (this > 60) {
      return 'Высокая влажность';
    }
    return 'Неизвестная влажность';
  }
}
