import 'package:flutter/material.dart';

import '../strings/app_strings.dart';
import '../styles/app_styles.dart';

class AppTheme {
  ThemeData get lightTheme => _buildTheme(Brightness.light);

  ThemeData get darkTheme => _buildTheme(Brightness.dark);

  ThemeData _buildTheme(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: Colors.blue,
    );
    return ThemeData(
        fontFamily: AppStrings.fontRaleway,
        colorScheme: colorScheme,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          showDragHandle: true,
        ),
        cardTheme: const CardThemeData(
          margin: EdgeInsets.zero,
        ),
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: AppStyles.mainBorder,
            border: Border.all(
              width: 1.0,
              color: colorScheme.primary,
            ),
          ),
          textStyle: TextStyle(
            color: colorScheme.onSurface,
            fontSize: 16.0,
            fontFamily: AppStrings.fontRaleway,
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
        )
    );
  }
}
