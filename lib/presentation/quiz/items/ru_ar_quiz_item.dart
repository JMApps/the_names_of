import 'package:flutter/material.dart';
import 'package:the_names_of/core/strings/app_strings.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/quiz_entity.dart';
import 'quiz_ru_ar_answer_item.dart';

class RuArQuizItem extends StatelessWidget {
  const RuArQuizItem({
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
                fontFamily: AppStrings.fontMontserrat,
                fontSize: 35.0,
                color: appColors.primary,
              ),
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
                  return QuizRuArAnswerItem(
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
