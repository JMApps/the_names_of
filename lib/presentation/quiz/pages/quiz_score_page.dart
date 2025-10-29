import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../state/quiz_ar_ru_state.dart';
import '../../state/quiz_ru_ar_state.dart';

class QuizScorePage extends StatefulWidget {
  const QuizScorePage({
    super.key,
    required this.quizMode,
  });

  final int quizMode;

  @override
  State<QuizScorePage> createState() => _QuizScorePageState();
}

class _QuizScorePageState extends State<QuizScorePage> {
  late int _countNumbers;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quizMode == 1 ? AppStrings.arabicRussian : AppStrings.russianArabic),
      ),
      body: Padding(
        padding: AppStyles.mainMardingHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: const SizedBox(),
            ),
            const Text(
              AppStrings.answersResult,
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            FutureBuilder(
              future: widget.quizMode == 1 ? Provider.of<QuizArRuState>(context, listen: false).fetchArRuTrueAnswers() : Provider.of<QuizRuArState>(context, listen: false).fetchRuArTrueAnswers(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Padding(
                      padding: AppStyles.mainMarding,
                      child: Text(
                        '${snapshot.error}',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: appColors.error,
                        ),
                      ),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  _countNumbers = snapshot.data!.length;
                  return Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: AppStyles.mainMarding,
                      child: Text(
                        '$_countNumbers из 99',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: AppStrings.fontGilroy,
                        ),
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
            Expanded(child: const SizedBox()),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (widget.quizMode == 1) {
                  Provider.of<QuizArRuState>(context, listen: false).resetQuiz();
                } else {
                  Provider.of<QuizRuArState>(context, listen: false).resetQuiz();
                }
              },
              color: appColors.primary,
              elevation: 0,
              shape: AppStyles.mainShape,
              padding: AppStyles.mainMardingBig,
              child: Text(
                AppStrings.resetQuiz,
                style: TextStyle(
                  fontSize: 18.0,
                  color: appColors.surface,
                ),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                SharePlus.instance.share(
                  ShareParams(
                    text: '${AppStrings.resultShare} $_countNumbers',
                    sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2),
                  ),
                );
              },
              color: appColors.primary.withAlpha(55),
              elevation: 0,
              shape: AppStyles.mainShape,
              padding: AppStyles.mainMardingBig,
              child: const Text(
                AppStrings.share,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            Expanded(child: const SizedBox()),
          ],
        ),
      ),
    );
  }
}
