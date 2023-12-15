part of 'weather_bloc.dart';

enum WeatherStatus { initial, loading, success, failure }

class WeatherState extends Equatable {
  final Weather weather;
  final WeatherStatus status;
  final String? errorMessage;

  const WeatherState({
    this.weather = Weather.empty,
    this.status = WeatherStatus.initial,
    this.errorMessage,
  });

  WeatherState copyWith(
          {Weather? weather, WeatherStatus? status, String? errorMessage}) =>
      WeatherState(
        weather: weather ?? this.weather,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [weather, status, errorMessage];
}
