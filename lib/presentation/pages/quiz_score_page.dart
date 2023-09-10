import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/data/local/database_quiz_query.dart';
import 'package:the_names_of/domain/models/arguments/quiz_mode_args.dart';

class QuizScorePage extends StatelessWidget {
  const QuizScorePage({super.key, required this.quizMode});

  final int quizMode;

  @override
  Widget build(BuildContext context) {
    int countNumbers = 0;
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: AppStyles.mainMarding,
          child: Column(
            children: [
              Text(
                quizMode == 1
                    ? AppStrings.fromArabicRussian
                    : AppStrings.fromRussianArabic,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: appColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              const Text(AppStrings.answersResult),
              const SizedBox(height: 16),
              FutureBuilder(
                future: quizMode == 1
                    ? DatabaseQuizQuery().getArRuTrueAnswers()
                    : DatabaseQuizQuery().getRuArTrueAnswers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    countNumbers = snapshot.data!.length;
                    return Text(
                      '${snapshot.data!.length} из 99',
                      style: TextStyle(
                        fontSize: 25,
                        color: appColors.error,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Padding(
                        padding: AppStyles.mainMarding,
                        child: Text(
                          '${snapshot.error}',
                          style: TextStyle(
                            fontSize: 18,
                            color: appColors.error,
                          ),
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    'crib_page',
                    arguments: QuizModeArgs(quizMode: quizMode),
                  );
                },
                child: const Text(
                  AppStrings.crib,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Share.share(
                    '${AppStrings.resultShare} $countNumbers',
                    sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2),
                  );
                },
                child: const Text(
                  AppStrings.share,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  AppStrings.close,
                  style: TextStyle(
                    fontSize: 18,
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
