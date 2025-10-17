import 'package:flutter/material.dart';

import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../../domain/entities/quiz_entity.dart';

class CorrectAnswerItem extends StatelessWidget {
  const CorrectAnswerItem({super.key, required this.model});

  final QuizEntity model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Padding(
      padding: AppStyles.mainMarding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${AppStrings.question} ${model.id}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: AppStyles.mainMardingMini,
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            decoration: BoxDecoration(
              color: appColors.inversePrimary,
              borderRadius: AppStyles.mainBorder,
            ),
            child: Text(
              model.question,
              style: const TextStyle(
                fontSize: 25,
                fontFamily: 'Scheherezade',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Text(
            AppStrings.trueAnswer,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Container(
            padding: AppStyles.mainMardingMini,
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            decoration: BoxDecoration(
              color: appColors.inversePrimary,
              borderRadius: AppStyles.mainBorder,
            ),
            child: Text(
              model.answers[model.correct],
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'Scheherezade',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
