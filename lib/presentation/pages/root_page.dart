import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/routes/app_routes.dart';
import '../../core/strings/app_strings.dart';
import '../../core/themes/app_theme.dart';
import '../state/content_settings_state.dart';
import 'main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContentSettingsState>(
      builder: (context, contentSettings, _) {
        final AppTheme appTheme = AppTheme();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          title: AppStrings.appName,
          theme: appTheme.lightTheme,
          darkTheme: appTheme.darkTheme,
          themeMode: contentSettings.appThemeMode,
          builder: (context, child) {
            final mediaQuery = MediaQuery.of(context);
            final double bottomInset = mediaQuery.viewPadding.bottom;
            return SafeArea(
              top: false,
              right: false,
              left: false,
              bottom: Platform.isAndroid && bottomInset > 12.0,
              child: child!,
            );
          },
          home: const MainPage(),
        );
      },
    );
  }
}
