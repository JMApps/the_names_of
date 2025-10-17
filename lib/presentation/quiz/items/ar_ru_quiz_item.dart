import 'package:flutter/material.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/quiz_entity.dart';
import 'quiz_ar_ru_answer_item.dart';

class ArRuQuizItem extends StatelessWidget {
  const ArRuQuizItem({super.key, required this.model, required this.index});

  final QuizEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return ListView(
      padding: AppStyles.mainMardingHorizontal,
      children: [
        Card(
          color: appColors.inversePrimary,
          shape: RoundedRectangleBorder(
            borderRadius: AppStyles.mainBorder,
            side: BorderSide(
              color: appColors.primary,
              width: 3.0,
            ),
          ),
          child: Padding(
            padding: AppStyles.mainMarding,
            child: Text(
              model.question,
              style: const TextStyle(
                fontFamily: AppStrings.fontScheherezade,
                fontSize: 35,
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 14),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: model.answers.length,
          itemBuilder: (BuildContext context, int index) {
            return QuizArRuAnswerItem(
              model: model,
              index: index,
            );
          },
        ),
      ],
    );
  }
}
