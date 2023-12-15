import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_api/weather_api.dart' as weather_api;
import 'package:weather_repository/src/models/models.dart';

class WeatherRepository {
  WeatherRepository({weather_api.WeatherApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? weather_api.WeatherApiClient();

  final weather_api.WeatherApiClient _weatherApiClient;

  Future<Weather> getWeather() async {
    final position = await Geolocator.getCurrentPosition();
    final placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    final weatherData = await _weatherApiClient.getWeather(
        position.latitude, position.longitude);
    final hourlyWeatherData = await _weatherApiClient.getHourlyWeather(
        position.latitude, position.longitude);
    return Weather(
      currentTemp: weatherData.currentTemp.toDouble(),
      minTemp: weatherData.minTemp.toDouble(),
      maxTemp: weatherData.maxTemp.toDouble(),
      windSpeed: weatherData.windSpeed.toDouble(),
      windDegrees: weatherData.windDegrees.toInt(),
      humidity: weatherData.humidity.toInt(),
      condition: weatherData.condition,
      description: weatherData.description,
      location: '${placemarks[0].administrativeArea}, ${placemarks[0].country}',
      hourlyWeather: hourlyWeatherData
          .map((e) => HourlyWeather(
                date: DateTime.fromMillisecondsSinceEpoch(e.timestamp * 1000),
                temperature: e.temperature,
                condition: e.condition,
                description: e.description,
              ))
          .toList(),
    );
  }
}
