import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Gilroy',
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.blue,
      secondary: Colors.red
    ),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 20,
        fontFamily: 'Gilroy',
      ),
    ),
    listTileTheme: const ListTileThemeData(
      visualDensity: VisualDensity(vertical: -4),
      shape: AppStyles.mainShape,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Gilroy',
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.blueGrey,
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
        fontFamily: 'Gilroy',
      ),
    ),
    listTileTheme: const ListTileThemeData(
      visualDensity: VisualDensity(vertical: -4),
      shape: AppStyles.mainShape,
    ),
  );
}

extension ColorSchemeS on ColorScheme {
  Color get contentCardColor => brightness == Brightness.light
      ? const Color(0xFFFFF3E0)
      : const Color(0x26E65100);

  Color get namesCardColor => brightness == Brightness.light
      ? const Color(0xFFFFEBEE)
      : const Color(0x26B71C1C);

  Color get clarificationCardColor => brightness == Brightness.light
      ? const Color(0xFFE8F5E9)
      : const Color(0x261B5E20);

  Color get quizCardColor => brightness == Brightness.light
      ? const Color(0xFFE3F2FD)
      : const Color(0x260D47A1);

  Color get cardsColor => brightness == Brightness.light
      ? const Color(0xFFFFFFFF)
      : const Color(0xBF1E1E1E);
}
