import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gazprom_test/weather/bloc/weather_bloc.dart';
import 'package:gazprom_test/weather/widgets/widgets.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc()..add(WeatherDataRequested()),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    final topBarHeight = MediaQuery.of(context).viewPadding.top;
    return BlocListener<WeatherBloc, WeatherState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, listenState) {
        if (listenState.status == WeatherStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  listenState.errorMessage ?? 'Ошибка загрузки данных',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
      },
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          final weather = state.weather;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(7, 0, 255, 0.7),
                  Colors.black,
                ],
              )),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                    children: [
                      SizedBox(height: topBarHeight),
                      Place(displayAddress: weather.location),
                      Expanded(
                        child: MainInfo(
                          currentTemp: weather.currentTemp.round(),
                          minTemp: weather.minTemp.round(),
                          maxTemp: weather.maxTemp.round(),
                          condition: weather.condition,
                        ),
                      ),
                      HourlyInfoCard(hourlyWeather: weather.hourlyWeather),
                      AdditionalInfoCard(
                        windSpeed: weather.windSpeed.round(),
                        windDegrees: weather.windDegrees,
                        humidity: weather.humidity,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
