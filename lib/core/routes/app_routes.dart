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
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.mainContentsPage:
        return MaterialPageRoute(
          builder: (_) => MainContentPage(),
        );
      case RouteNames.mainNamesPage:
        return MaterialPageRoute(
          builder: (_) => MainNamesPage(),
        );
      case RouteNames.mainClarificationsPage:
        return MaterialPageRoute(
          builder: (_) => MainClarificationPage(),
        );
      case RouteNames.arRuQuizPage:
        return MaterialPageRoute(
          builder: (_) => const ArRuQuizPage(),
        );
      case RouteNames.ruArQuizPage:
        return MaterialPageRoute(
          builder: (_) => const RuArQuizPage(),
        );
      case RouteNames.quizScorePage:
        final int quizModeArgs = routeSettings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => QuizScorePage(quizMode: quizModeArgs),
        );
      case RouteNames.cardsNamePage:
        return MaterialPageRoute(
          builder: (_) => const CardsNamePage(),
        );
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
