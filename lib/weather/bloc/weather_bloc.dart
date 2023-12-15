import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends HydratedBloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(const WeatherState()) {
    on<WeatherDataRequested>((event, emit) async {
      if (state.status == WeatherStatus.initial) {
        emit(state.copyWith(status: WeatherStatus.loading));
      }
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        emit(state.copyWith(
          status: WeatherStatus.failure,
          errorMessage:
              'Невозможно получить данные без предоставления разрешений',
        ));
        return;
      }
      try {
        final weather = await _weatherRepository.getWeather();
        emit(state.copyWith(weather: weather, status: WeatherStatus.success));
      } catch (e) {
        emit(state.copyWith(status: WeatherStatus.failure));
      }
    });
  }

  final _weatherRepository = WeatherRepository();

  @override
  WeatherState? fromJson(Map<String, dynamic> json) => WeatherState(
        weather: Weather.fromJson(json),
        status: WeatherStatus.success,
      );

  @override
  Map<String, dynamic>? toJson(WeatherState state) => state.weather.toJson();
}
