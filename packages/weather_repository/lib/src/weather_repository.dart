import 'package:geolocator/geolocator.dart';
import 'package:weather_api/weather_api.dart';

class WeatherRepository {
  WeatherRepository({WeatherApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? WeatherApiClient();

  final WeatherApiClient _weatherApiClient;

  Future<void> getWeather() async {
    final position = await Geolocator.getCurrentPosition();
    // get weather
    final weatherData = await _weatherApiClient.getWeather(
        position.latitude, position.longitude);
    // get hourly weather
    final hourlyWeatherData = await _weatherApiClient.getHourlyWeather(
        position.latitude, position.longitude);
  }
}
