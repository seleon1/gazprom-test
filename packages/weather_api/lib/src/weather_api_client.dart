import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_api/src/models/models.dart';

class WeatherRequestFailure implements Exception {}

class WeatherNotFoundFailure implements Exception {}

class HourlyWeatherRequestFailure implements Exception {}

class HourlyWeatherNotFoundFailure implements Exception {}

class WeatherApiClient {
  WeatherApiClient({Dio? dio}) : _dio = dio ?? Dio();
  final Dio _dio;

  static const _baseWeatherUrl = 'https://api.openweathermap.org';

  // Weather
  Future<void> getWeather(double lat, double lon) async {
    // https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&units=metric&appid=2e4f67869320be754947b22d7893aba1
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

    final bodyJson = jsonDecode(response.data) as Map<String, dynamic>;

    if (!bodyJson.containsKey('weather') ||
        !bodyJson.containsKey('main') ||
        !bodyJson.containsKey('wind')) {
      throw WeatherNotFoundFailure();
    }
    inspect(bodyJson);
  }

  // List<HourlyWeather>
  Future<void> getHourlyWeather(double lat, double lon) async {
    // https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&units=metric&cnt=4&appid=2e4f67869320be754947b22d7893aba1
    final response =
        await _dio.get('$_baseWeatherUrl/data/2.5/forecast', queryParameters: {
      'lat': lat,
      'lon': lon,
      'units': 'metric',
      'appid': '2e4f67869320be754947b22d7893aba1',
    });

    if (response.statusCode != 200) {
      throw HourlyWeatherRequestFailure();
    }

    final bodyJson = jsonDecode(response.data) as Map<String, dynamic>;

    if (!bodyJson.containsKey('weather') ||
        !bodyJson.containsKey('main') ||
        !bodyJson.containsKey('wind')) {
      throw WeatherNotFoundFailure();
    }

    inspect(bodyJson);
  }
}
