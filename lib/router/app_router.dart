import 'package:flutter/material.dart';
import 'package:the_names_of/components/dialog_arabic_answer_results.dart';
import 'package:the_names_of/components/dialog_russian_answer_results.dart';
import 'package:the_names_of/pages/card_names_page.dart';
import 'package:the_names_of/pages/content_page.dart';
import 'package:the_names_of/pages/names_page.dart';
import 'package:the_names_of/pages/quiz_page.dart';
import 'package:the_names_of/pages/quiz_question_page.dart';
import 'package:the_names_of/pages/root_page.dart';
import 'package:the_names_of/pages/tafsirs_page.dart';
import 'package:the_names_of/score/score_arabic_page.dart';

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
      case '/quiz_score':
        return MaterialPageRoute(
            builder: (_) => ScoreArabicPage(), settings: routeSettings);
        case '/russian_answer_result':
        return MaterialPageRoute(
            builder: (_) => DialogRussianAnswerResults(), settings: routeSettings);
        case '/arabic_answer_result':
        return MaterialPageRoute(
            builder: (_) => DialogArabicAnswerResults(), settings: routeSettings);
      default:
        throw Exception('Invalid route');
    }
  }
}
