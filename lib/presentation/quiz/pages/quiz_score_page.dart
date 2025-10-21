import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/quiz_ar_ru_state.dart';
import '../../state/quiz_ru_ar_state.dart';

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                AppStrings.resultShare,
                style: AppStyles.mainTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              FutureBuilder(
                future: quizMode == 1
                    ? Provider.of<QuizArRuState>(context, listen: false).fetchAllArRuQuiz()
                    : Provider.of<QuizRuArState>(context, listen: false).fetchAllRuArQuiz(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Padding(
                        padding: AppStyles.mainMarding,
                        child: Text(
                          '${snapshot.error}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: appColors.error,
                          ),
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    countNumbers = snapshot.data!.length;
                    return Card(
                      child: Padding(
                        padding: AppStyles.mainMarding,
                        child: Text(
                          '${snapshot.data!.length} из 99',
                          style: TextStyle(fontSize: 25.0, fontFamily: AppStrings.fontGilroy),
                          textAlign: TextAlign.center,
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
                    RouteNames.cribPage,
                    arguments: quizMode,
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
                  SharePlus.instance.share(
                    ShareParams(
                      text: '${AppStrings.resultShare} $countNumbers',
                      sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2),
                    ),
                  );
                },
                child: const Text(
                  AppStrings.share,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
