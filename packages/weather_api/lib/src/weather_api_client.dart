import 'package:dio/dio.dart';
import 'package:weather_api/src/models/models.dart';

class WeatherRequestFailure implements Exception {}

class WeatherDataNotFoundFailure implements Exception {}

class HourlyWeatherRequestFailure implements Exception {}

class HourlyWeatherDataNotFoundFailure implements Exception {}

class WeatherApiClient {
  WeatherApiClient({Dio? dio}) : _dio = dio ?? Dio();
  final Dio _dio;

  static const _baseWeatherUrl = 'https://api.openweathermap.org';

  Future<Weather> getWeather(double lat, double lon) async {
    final response =
        await _dio.get('$_baseWeatherUrl/data/2.5/weather', queryParameters: {
      'lat': lat,
      'lon': lon,
      'units': 'metric',
      'appid': '2e4f67869320be754947b22d7893aba1',
    });

    if (response.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    final body = response.data as Map<String, dynamic>;

    if (!body.containsKey('weather') ||
        !body.containsKey('main') ||
        !body.containsKey('wind')) {
      throw WeatherDataNotFoundFailure();
    }

    return Weather.fromJson(body);
  }

  Future<List<HourlyWeather>> getHourlyWeather(double lat, double lon) async {
    final response =
        await _dio.get('$_baseWeatherUrl/data/2.5/forecast', queryParameters: {
      'lat': lat,
      'lon': lon,
      'cnt': 4,
      'units': 'metric',
      'appid': '2e4f67869320be754947b22d7893aba1',
    });

    if (response.statusCode != 200) {
      throw HourlyWeatherRequestFailure();
    }

    final bodyJson = response.data as Map<String, dynamic>;

    if (!bodyJson.containsKey('list')) {
      throw HourlyWeatherDataNotFoundFailure();
    }

    final weatherList = bodyJson['list'] as List;

    return weatherList
        .map((json) => HourlyWeather.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
