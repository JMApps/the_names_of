import 'package:flutter/material.dart';
import 'package:the_names_of/application/routes/route_names.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/styles/app_styles.dart';

class SelectQuiz extends StatelessWidget {
  const SelectQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    return Padding(
      padding: AppStyles.mainMarding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppStrings.quiz,
            style: TextStyle(
              color: appTheme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, RouteNames.arRuQuizPage);
            },
            title: Text(
              AppStrings.arabicRussian,
              style: appTheme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            leading: Icon(
              Icons.translate,
              color: appTheme.colorScheme.primary,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, RouteNames.ruArQuizPage);
            },
            title: Text(
              AppStrings.russianArabic,
              style: appTheme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            leading: Icon(
              Icons.translate,
              color: appTheme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
