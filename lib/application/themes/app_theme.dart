import 'package:flutter/material.dart';

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
  );
}

extension ColorSchemeS on ColorScheme {}
