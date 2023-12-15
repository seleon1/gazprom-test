import 'package:equatable/equatable.dart';

class HourlyWeather extends Equatable {
  final DateTime date;
  final double temperature;
  final String condition, description;

  const HourlyWeather({
    required this.date,
    required this.temperature,
    required this.condition,
    required this.description,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) => HourlyWeather(
        date: DateTime.parse(json['date']),
        temperature: json['temperature'] as double,
        condition: json['condition'] as String,
        description: json['description'] as String,
      );

  Map<String, dynamic> toJson() => {
        'date': date.toString(),
        'temperature': temperature,
        'condition': condition,
        'description': description,
      };

  @override
  List<Object?> get props => [date, temperature, condition, description];
}
