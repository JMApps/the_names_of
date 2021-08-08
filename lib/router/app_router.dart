import 'package:flutter/material.dart';
import 'package:the_names_of/pages/content_page.dart';
import 'package:the_names_of/pages/main_page.dart';
import 'package:the_names_of/pages/names_page.dart';
import 'package:the_names_of/pages/quiz_page.dart';
import 'package:the_names_of/pages/tafsirs_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/names':
        return MaterialPageRoute(builder: (_) => NamesPage());
      case '/tafsirs':
        return MaterialPageRoute(builder: (_) => TafsirsPage());
      case '/contents':
        return MaterialPageRoute(builder: (_) => ContentPage());
      case '/quiz':
        return MaterialPageRoute(builder: (_) => QuizPage());
      default:
        throw Exception('Invalid route');
    }
  }
}
