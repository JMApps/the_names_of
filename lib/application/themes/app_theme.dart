import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    fontFamily: 'Gilroy',
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.blue,
      secondary: Colors.red,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
    cardTheme: const CardTheme(
      margin: AppStyles.mainMarding,
      shape: AppStyles.mainShape,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 20,
        fontFamily: 'Gilroy',
      ),
    ),
    listTileTheme: const ListTileThemeData(
      shape: AppStyles.mainShape,
      titleTextStyle: TextStyle(
        fontSize: 20,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    fontFamily: 'Gilroy',
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.deepPurple,
      secondary: Colors.red,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
    cardTheme: const CardTheme(
      margin: AppStyles.mainMarding,
      shape: AppStyles.mainShape,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 20,
        fontFamily: 'Gilroy',
      ),
    ),
    listTileTheme: const ListTileThemeData(
      shape: AppStyles.mainShape,
      titleTextStyle: TextStyle(
        fontSize: 20,
      ),
    ),
  );
}

extension ColorSchemeS on ColorScheme {
  Color get contentColor => brightness == Brightness.light
      ? const Color(0xFFE65100)
      : const Color(0xFFE65100);
}
