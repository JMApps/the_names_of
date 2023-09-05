import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Gilroy',
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.blue,
      secondary: Colors.red,
    ),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
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
      scrolledUnderElevation: 0,
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

  LinearGradient get mainGradient => brightness == Brightness.light
      ? const LinearGradient(
          colors: [
            Color(0xFF1976D2),
            Color(0xFF2196F3),
            Color(0xFF64B5F6),
          ],
        )
      : const LinearGradient(
          colors: [
            Color(0xFF082B67),
            Color(0xFF0D4383),
            Color(0xFF0B5EB2),
          ],
        );

  LinearGradient get contentGradient => brightness == Brightness.light
      ? const LinearGradient(
          colors: [
            Color(0xFFF57C00),
            Color(0xFFFF9800),
            Color(0xFFFFB74D),
          ],
        )
      : const LinearGradient(
          colors: [
            Color(0x66E65100),
            Color(0x40EF6C00),
            Color(0x26F57C00),
          ],
        );

  LinearGradient get namesGradient => brightness == Brightness.light
      ? const LinearGradient(
          colors: [
            Color(0xFFD32F2F),
            Color(0xFFF44336),
            Color(0xFFE57373),
          ],
        )
      : const LinearGradient(
          colors: [
            Color(0x66B71C1C),
            Color(0x40C62828),
            Color(0x26D32F2F),
          ],
        );

  LinearGradient get clarificationsGradient => brightness == Brightness.light
      ? const LinearGradient(
          colors: [
            Color(0xFF388E3C),
            Color(0xFF4CAF50),
            Color(0xFF81C784),
          ],
        )
      : const LinearGradient(
          colors: [
            Color(0x661B5E20),
            Color(0x402E7D32),
            Color(0x26388e3c),
          ],
        );
}
