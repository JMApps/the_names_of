import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/routes/app_routes.dart';
import '../../application/state/content_settings_state.dart';
import '../../application/strings/app_strings.dart';
import '../../application/themes/app_theme.dart';
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
          home: const MainPage(),
        );
      },
    );
  }
}
