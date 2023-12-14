import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final double currentTemp, minTemp, maxTemp, windSpeed, windDegrees;
  final String condition;

  const Weather({
    required this.currentTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.windSpeed,
    required this.windDegrees,
    required this.condition,
  });

  @override
  List<Object?> get props => [
        currentTemp,
        minTemp,
        maxTemp,
        windSpeed,
        windDegrees,
        condition,
      ];
}
