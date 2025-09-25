import 'package:flutter/material.dart';

import '../../application/styles/app_styles.dart';
import '../../domain/entities/quiz_entity.dart';
import 'quiz_ru_ar_answer_item.dart';

class RuArQuizItem extends StatelessWidget {
  const RuArQuizItem({super.key, required this.model, required this.index});

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
                fontFamily: 'Montserrat',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
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
            return QuizRuArAnswerItem(
              model: model,
              index: index,
            );
          },
        ),
      ],
    );
  }
}
