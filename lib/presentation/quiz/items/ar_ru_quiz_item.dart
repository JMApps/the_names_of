import 'package:flutter/material.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/quiz_entity.dart';
import 'quiz_ar_ru_answer_item.dart';

class ArRuQuizItem extends StatelessWidget {
  const ArRuQuizItem({
    super.key,
    required this.model,
    required this.index,
  });

  final QuizEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          shape: AppStyles.mainShape,
          margin: AppStyles.mainMardingHorizontalMini,
          child: Padding(
            padding: AppStyles.mainMarding,
            child: Text(
              model.question,
              style: TextStyle(
                fontFamily: AppStrings.fontNotoNaskh,
                fontSize: 50.0,
                color: appColors.primary,
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: AppStyles.mainMarding,
                itemCount: model.answers.length,
                itemBuilder: (BuildContext context, int index) {
                  return QuizArRuAnswerItem(
                    model: model,
                    index: index,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
