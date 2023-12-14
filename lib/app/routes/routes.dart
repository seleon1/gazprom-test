import 'package:gazprom_test/app/app.dart';
import 'package:gazprom_test/login/login.dart';
import 'package:gazprom_test/weather/weather.dart';
import 'package:go_router/go_router.dart';

GoRouter buildRouter(AppStatus appStatus) => GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'weather',
          builder: (context, state) => WeatherPage(),
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => LoginPage(),
        ),
      ],
      redirect: (context, state) {
        if (appStatus == AppStatus.unauthenticated) {
          return '/login';
        }
        return null;
      },
    );
