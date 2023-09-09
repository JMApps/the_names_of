import 'package:flutter/material.dart';
import 'package:the_names_of/domain/models/arguments/main_args.dart';
import 'package:the_names_of/domain/models/arguments/quiz_mode_args.dart';
import 'package:the_names_of/presentation/pages/ar_ru_quiz_page.dart';
import 'package:the_names_of/presentation/pages/crib_page.dart';
import 'package:the_names_of/presentation/pages/quiz_score_page.dart';
import 'package:the_names_of/presentation/pages/ru_ar_quiz_page.dart';
import 'package:the_names_of/presentation/pages/main_clarification_page.dart';
import 'package:the_names_of/presentation/pages/main_content_page.dart';
import 'package:the_names_of/presentation/pages/main_names_page.dart';
import 'package:the_names_of/presentation/pages/name_cards_page.dart';
import 'package:the_names_of/presentation/pages/settings_page.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case 'main_contents_page':
        final MainArgs args = routeSettings.arguments as MainArgs;
        return MaterialPageRoute(
          builder: (_) => MainContentPage(contentIndex: args.index),
        );
      case 'main_names_page':
        final MainArgs args = routeSettings.arguments as MainArgs;
        return MaterialPageRoute(
          builder: (_) => MainNamesPage(nameIndex: args.index),
        );
      case 'main_clarifications_page':
        final MainArgs args = routeSettings.arguments as MainArgs;
        return MaterialPageRoute(
          builder: (_) => MainClarificationPage(clarificationIndex: args.index),
        );
      case 'app_settings_page':
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
        );
      case 'name_cards_page':
        return MaterialPageRoute(
          builder: (_) => const NameCardsPage(),
        );
      case 'ar_ru_quiz_page':
        return MaterialPageRoute(
          builder: (_) => const ArRuQuizPage(),
        );
      case 'ru_ar_quiz_page':
        return MaterialPageRoute(
          builder: (_) => const RuArQuizPage(),
        );
      case 'quiz_score_page':
        final QuizModeArgs args = routeSettings.arguments as QuizModeArgs;
        return MaterialPageRoute(
          builder: (_) => QuizScorePage(quizMode: args.quizMode),
        );
      case 'crib_page':
        final QuizModeArgs args = routeSettings.arguments as QuizModeArgs;
        return MaterialPageRoute(
          builder: (_) => CribPage(quizMode: args.quizMode),
        );
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
