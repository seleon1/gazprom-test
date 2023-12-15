import 'package:equatable/equatable.dart';

class HourlyWeather extends Equatable {
  final int timestamp;
  final double temperature;
  final String condition, description;

  const HourlyWeather({
    required this.timestamp,
    required this.temperature,
    required this.condition,
    required this.description,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) => HourlyWeather(
        timestamp: json['dt'] as int,
        temperature: json['main']['temp'] as double,
        condition: json['weather'][0]['main'] as String,
        description: json['weather'][0]['description'] as String,
      );

  @override
  List<Object?> get props => [timestamp, temperature, condition, description];
}
