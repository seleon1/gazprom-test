import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final num currentTemp, minTemp, maxTemp, windSpeed, windDegrees, humidity;
  final String condition, description;

  const Weather({
    required this.currentTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.windSpeed,
    required this.windDegrees,
    required this.humidity,
    required this.condition,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        currentTemp: json['main']['temp'] as num,
        minTemp: json['main']['temp_min'] as num,
        maxTemp: json['main']['temp_max'] as num,
        windSpeed: json['wind']['speed'] as num,
        windDegrees: json['wind']['deg'] as num,
        humidity: json['main']['humidity'] as num,
        condition: json['weather'][0]['main'] as String,
        description: json['weather'][0]['description'] as String,
      );

  @override
  List<Object?> get props => [
        currentTemp,
        minTemp,
        maxTemp,
        windSpeed,
        windDegrees,
        humidity,
        condition,
        description,
      ];
}
