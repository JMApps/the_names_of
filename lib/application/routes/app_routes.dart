import 'package:flutter/material.dart';

import '../../data/models/arguments/index_args.dart';
import '../../data/models/arguments/quiz_mode_args.dart';
import '../../presentation/pages/ar_ru_quiz_page.dart';
import '../../presentation/pages/crib_page.dart';
import '../../presentation/pages/main_clarification_page.dart';
import '../../presentation/pages/main_content_page.dart';
import '../../presentation/pages/main_names_page.dart';
import '../../presentation/pages/name_cards_page.dart';
import '../../presentation/pages/quiz_score_page.dart';
import '../../presentation/pages/ru_ar_quiz_page.dart';
import '../../presentation/pages/settings_page.dart';
import 'route_names.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.mainContentsPage:
        final IndexArgs indexArgs = routeSettings.arguments as IndexArgs;
        return MaterialPageRoute(
          builder: (_) => MainContentPage(contentIndex: indexArgs.index),
        );
      case RouteNames.mainNamesPage:
        final IndexArgs indexArgs = routeSettings.arguments as IndexArgs;
        return MaterialPageRoute(
          builder: (_) => MainNamesPage(nameIndex: indexArgs.index),
        );
      case RouteNames.mainClarificationsPage:
        final IndexArgs indexArgs = routeSettings.arguments as IndexArgs;
        return MaterialPageRoute(
          builder: (_) => MainClarificationPage(clarificationIndex: indexArgs.index),
        );
      case RouteNames.appSettingsPage:
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
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
        final QuizModeArgs quizModeArgs = routeSettings.arguments as QuizModeArgs;
        return MaterialPageRoute(
          builder: (_) => QuizScorePage(quizMode: quizModeArgs.quizMode),
        );
      case RouteNames.cribPage:
        final QuizModeArgs quizModeArgs = routeSettings.arguments as QuizModeArgs;
        return MaterialPageRoute(
          builder: (_) => CribPage(quizMode: quizModeArgs.quizMode),
        );
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
