import 'package:flutter/material.dart';
import 'package:the_names_of/pages/card_names_page.dart';
import 'package:the_names_of/pages/content_page.dart';
import 'package:the_names_of/pages/names_page.dart';
import 'package:the_names_of/pages/quiz_page.dart';
import 'package:the_names_of/pages/quiz_question_page.dart';
import 'package:the_names_of/pages/root_page.dart';
import 'package:the_names_of/pages/tafsirs_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => RootPage(), settings: routeSettings);
      case '/names':
        return MaterialPageRoute(
            builder: (_) => NamesPage(), settings: routeSettings);
      case '/tafsirs':
        return MaterialPageRoute(
            builder: (_) => TafsirsPage(), settings: routeSettings);
      case '/contents':
        return MaterialPageRoute(
            builder: (_) => ContentPage(), settings: routeSettings);
      case '/cards':
        return MaterialPageRoute(
            builder: (_) => CardNamesPage(), settings: routeSettings);
      case '/quiz':
        return MaterialPageRoute(
            builder: (_) => QuizPage(), settings: routeSettings);
      case '/quiz_question':
        return MaterialPageRoute(
            builder: (_) => QuizQuestionPage(), settings: routeSettings);
      default:
        throw Exception('Invalid route');
    }
  }
}
