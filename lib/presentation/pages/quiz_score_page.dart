import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/application/themes/app_theme.dart';
import 'package:the_names_of/data/local/database_quiz_query.dart';

class QuizScorePage extends StatelessWidget {
  const QuizScorePage({super.key, required this.quizMode});

  final int quizMode;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: AppStyles.mainMarding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                quizMode == 1
                    ? AppStrings.fromArabicRussian
                    : AppStrings.fromRussianArabic,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(AppStrings.answersResult),
              const SizedBox(height: 16),
              FutureBuilder(
                  future: DatabaseQuizQuery().getRuArTrueAnswers(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        '${snapshot.data!.length} из 99',
                        style: TextStyle(
                          fontSize: 25,
                          color: appColors.incorrectColor,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }),
              const SizedBox(height: 16),
              MaterialButton(
                onPressed: () {
                  Share.share('');
                },
                shape: AppStyles.mainShape,
                color: appColors.primary,
                child: const Text(
                  AppStrings.share,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                shape: AppStyles.mainShape,
                color: appColors.incorrectColor,
                child: const Text(
                  AppStrings.close,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
