import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Nexa',
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.blue,
      secondary: Colors.teal,
    ),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 20,
        fontFamily: 'Nexa',
      ),
    ),
    listTileTheme: const ListTileThemeData(
      visualDensity: VisualDensity(vertical: -4),
      shape: AppStyles.mainShape,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Nexa',
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.blue,
      secondary: Colors.grey,
    ),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 20,
        fontFamily: 'Nexa',
      ),
    ),
    listTileTheme: const ListTileThemeData(
      visualDensity: VisualDensity(vertical: -4),
      shape: AppStyles.mainShape,
    ),
  );
}

extension ColorSchemeS on ColorScheme {

  Color get correctColor => brightness == Brightness.light
      ? const Color(0xFF009688)
      : const Color(0xBF004D40);

  Color get incorrectColor => brightness == Brightness.light
      ? const Color(0xFFF44336)
      : const Color(0xBFB71C1C);
}
