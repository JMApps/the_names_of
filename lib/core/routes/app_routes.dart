import 'package:flutter/material.dart';

import '../../presentation/cards/pages/cards_name_page.dart';
import '../../presentation/clarification/pages/main_clarification_page.dart';
import '../../presentation/content/pages/main_content_page.dart';
import '../../presentation/names/pages/main_names_page.dart';
import '../../presentation/quiz/pages/ar_ru_quiz_page.dart';
import '../../presentation/quiz/pages/quiz_score_page.dart';
import '../../presentation/quiz/pages/ru_ar_quiz_page.dart';
import 'route_names.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    Widget page;
    switch (settings.name) {
      case RouteNames.mainContentsPage:
        page = const MainContentPage();
        break;
      case RouteNames.mainNamesPage:
        page = const MainNamesPage();
        break;
      case RouteNames.mainClarificationsPage:
        page = const MainClarificationPage();
        break;
      case RouteNames.arRuQuizPage:
        page = const ArRuQuizPage();
        break;
      case RouteNames.ruArQuizPage:
        page = const RuArQuizPage();
        break;
      case RouteNames.cardsNamePage:
        page = const CardsNamePage();
        break;
      case RouteNames.quizScorePage:
        final quizMode = args is int ? args : 0;
        page = QuizScorePage(quizMode: quizMode);
        break;
      default:
        page = _errorRoute(settings.name);
        break;
    }

    return _buildRoute(page, settings);
  }

  static MaterialPageRoute<dynamic> _buildRoute(Widget page, RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => page,
      settings: settings,
    );
  }

  static Widget _errorRoute(String? name) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ошибка маршрута')),
      body: Center(
        child: Text(
          'Неизвестный маршрут:\n$name',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
