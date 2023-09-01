import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.blue,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      shape: AppStyles.appBarShare,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.deepPurple,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      shape: AppStyles.appBarShare,
    ),
  );
}
