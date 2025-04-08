import 'package:app_cities_flutter/pages/citiesScreen.dart';
import 'package:app_cities_flutter/pages/cityDetailsScreen.dart';
import 'package:app_cities_flutter/pages/loginScreen.dart';
import 'package:app_cities_flutter/pages/splashPage.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.cities:
        final username = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => CitiesScreen(username: username),
        );
      case Routes.cityDetails:
        final args = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (_) => CityDetailsScreen(
            cityName: args['name']!,
            cityImage: args['image']!,
            cityDescription: args['description']!,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
