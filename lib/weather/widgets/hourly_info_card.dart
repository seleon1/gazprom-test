import 'package:flutter/material.dart';
import 'package:gazprom_test/weather/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:weather_repository/weather_repository.dart';

class HourlyInfoCard extends StatelessWidget {
  const HourlyInfoCard({super.key, required this.hourlyWeather});

  final List<HourlyWeather> hourlyWeather;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('d MMMM', 'ru');
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Card(
        color: const Color.fromRGBO(255, 255, 255, 0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Сегодня',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  dateFormat.format(DateTime.now()),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.white),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: hourlyWeather
                  .map((e) => HourlyInfoElement(
                        time: TimeOfDay.fromDateTime(e.date).format(context),
                        temperature: e.temperature.round(),
                        iconName: e.iconName,
                      ))
                  .toList(),
            ),
          )
        ]),
      ),
    );
  }
}

extension WeatherIcon on HourlyWeather {
  String get iconName {
    switch (description) {
      case 'few clouds':
        return date.hour > 17 || date.hour < 5
            ? 'few clouds night'
            : 'few clouds day';
      case 'clear sky':
      case 'shower rain':
      case 'snow':
      case 'thunderstorm':
        return description;
      default:
        switch (condition) {
          case 'Thunderstorm':
            return 'thunderstorm';
          case 'Rain':
          case 'Drizzle':
            return 'shower rain';
          case 'Snow':
            return 'snow';
          case 'Clear':
            return 'clear sky';
          case 'Clouds':
            return date.hour > 17 || date.hour < 5
                ? 'few clouds night'
                : 'few clouds day';
          default:
            return 'unknown';
        }
    }
  }
}
