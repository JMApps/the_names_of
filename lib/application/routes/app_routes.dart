import 'package:flutter/material.dart';
import 'package:the_names_of/domain/models/arguments/main_args.dart';
import 'package:the_names_of/presentation/pages/main_content_page.dart';
import 'package:the_names_of/presentation/pages/main_names_page.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case 'main_contents_page':
        final MainArgs args = routeSettings.arguments as MainArgs;
        return MaterialPageRoute(
          builder: (_) => MainContentPage(contentId: args.contentId),
        );
      case 'main_names_page':
        return MaterialPageRoute(
          builder: (_) => const MainNamesPage(),
        );
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
