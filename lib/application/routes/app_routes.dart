import 'package:flutter/material.dart';
import 'package:the_names_of/presentation/pages/main_names_page.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case 'main_names_page':
        return MaterialPageRoute(
          builder: (_) => const MainNamesPage(),
        );
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
