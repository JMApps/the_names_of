import 'package:flutter/material.dart';

import '../../presentation/clarification/pages/main_clarification_page.dart';
import '../../presentation/content/pages/main_content_page.dart';
import '../../presentation/pages/crib_page.dart';
import '../../presentation/pages/main_names_page.dart';
import '../../presentation/pages/name_cards_page.dart';
import '../../presentation/pages/quiz_score_page.dart';
import '../../presentation/quiz/pages/ar_ru_quiz_page.dart';
import '../../presentation/quiz/pages/ru_ar_quiz_page.dart';
import 'route_names.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.mainContentsPage:
        final int indexArgs = routeSettings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => MainContentPage(contentIndex: indexArgs),
        );
      case RouteNames.mainNamesPage:
        final int indexArgs = routeSettings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => MainNamesPage(nameIndex: indexArgs),
        );
      case RouteNames.mainClarificationsPage:
        final int indexArgs = routeSettings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => MainClarificationPage(clarificationIndex: indexArgs),
        );
      case RouteNames.nameCardsPage:
        return MaterialPageRoute(
          builder: (_) => const NameCardsPage(),
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
      case RouteNames.cribPage:
        final int quizModeArgs = routeSettings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => CribPage(quizMode: quizModeArgs),
        );
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
