import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../application/strings/app_strings.dart';
import '../../application/styles/app_styles.dart';
import '../../data/models/arguments/quiz_mode_args.dart';
import '../../data/repositories/quiz_data_repository.dart';

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
                    ? QuizDataRepository().getArRuTrueAnswers()
                    : QuizDataRepository().getRuArTrueAnswers(),
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
