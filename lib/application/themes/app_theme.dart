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
      backgroundColor: Color(0xFF42A5F5),
    ),
    cardTheme: const CardTheme(
      margin: AppStyles.mainMarding,
      shape: AppStyles.mainShape,
      elevation: 3,
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
      elevation: 3,
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
  Color get contentColor50 => brightness == Brightness.light
      ? const Color(0xFFFFF3E0)
      : const Color(0x26E65100);

  Color get namesColor50 => brightness == Brightness.light
      ? const Color(0xFFFFEBEE)
      : const Color(0x26B71C1C);

  Color get clarificationsColor50 => brightness == Brightness.light
      ? const Color(0xFFE8F5E9)
      : const Color(0x261B5E20);

  Color get toContentTileColor => brightness == Brightness.light
      ? const Color(0xFFBDBDBD)
      : const Color(0xFF424242);

  Color get mainDefault => brightness == Brightness.light
      ? const Color(0xFF262626)
      : const Color(0xFFD5D5D5);

  Color get quizColor => brightness == Brightness.light
      ? const Color(0xFFFFEBEE)
      : const Color(0x26B71C1C);

  Color get cardsColor => brightness == Brightness.light
      ? const Color(0xFFE3F2FD)
      : const Color(0x260D47A1);
}
