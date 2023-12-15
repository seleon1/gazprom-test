import 'package:equatable/equatable.dart';
import 'package:weather_repository/src/models/hourly_weather.dart';

class Weather extends Equatable {
  final double currentTemp, minTemp, maxTemp, windSpeed;
  final int humidity, windDegrees;
  final String condition, description, location;
  final List<HourlyWeather> hourlyWeather;

  const Weather({
    required this.currentTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.windSpeed,
    required this.windDegrees,
    required this.humidity,
    required this.condition,
    required this.description,
    required this.location,
    required this.hourlyWeather,
  });

  static const empty = Weather(
    currentTemp: 0,
    minTemp: 0,
    maxTemp: 0,
    windSpeed: 0,
    windDegrees: 0,
    humidity: 0,
    condition: '',
    description: '',
    location: '',
    hourlyWeather: [],
  );

  bool get isEmpty => this == Weather.empty;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        currentTemp: json['current_temperature'] as double,
        minTemp: json['min_temperature'] as double,
        maxTemp: json['max_temperature'] as double,
        windSpeed: json['wind_speed'] as double,
        windDegrees: json['wind_degrees'] as int,
        humidity: json['humidity'] as int,
        condition: json['condition'] as String,
        description: json['description'] as String,
        location: json['location'] as String,
        hourlyWeather: (json['hourly_weather'] as List)
            .map((e) => HourlyWeather.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'current_temperature': currentTemp,
        'min_temperature': minTemp,
        'max_temperature': maxTemp,
        'wind_speed': windSpeed,
        'wind_degrees': windDegrees,
        'humidity': humidity,
        'condition': condition,
        'description': description,
        'location': location,
        'hourly_weather': hourlyWeather.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        currentTemp,
        minTemp,
        maxTemp,
        windSpeed,
        windDegrees,
        condition,
        description,
        location,
        hourlyWeather,
      ];
}
