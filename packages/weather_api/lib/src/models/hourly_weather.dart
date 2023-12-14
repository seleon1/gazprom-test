import 'package:equatable/equatable.dart';

class HourlyWeather extends Equatable {
  final int timestamp;
  final double temperature;
  final String condition;

  const HourlyWeather({
    required this.timestamp,
    required this.temperature,
    required this.condition,
  });

  @override
  List<Object?> get props => [timestamp, temperature, condition];
}
