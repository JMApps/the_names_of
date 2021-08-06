import 'package:flutter/material.dart';
import 'package:the_names_of/pages/main_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainPage());
      default:
        throw Exception('Invalid route');
    }
  }
}
