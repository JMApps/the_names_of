import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/application/routes/app_routes.dart';
import 'package:the_names_of/application/state/content_settings_state.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/themes/app_theme.dart';
import 'package:the_names_of/presentation/pages/main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ContentSettingsState settings = Provider.of<ContentSettingsState>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      title: AppStrings.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settings.getAdaptiveTheme
          ? ThemeMode.system
          : settings.getDarkTheme
              ? ThemeMode.dark
              : ThemeMode.light,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.unknown,
        },
      ),
      home: const MainPage(),
    );
  }
}
