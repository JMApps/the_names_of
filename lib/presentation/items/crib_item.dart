import 'package:flutter/material.dart';

import '../../core/styles/app_styles.dart';
import '../../domain/entities/quiz_entity.dart';
import 'correct_answer_item.dart';

class CribItem extends StatelessWidget {
  const CribItem({
    super.key,
    required this.quizModel,
    required this.index,
  });

  final QuizEntity quizModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    Color cardColor() {
      if (quizModel.answerState == 1) {
        return appColors.inversePrimary.withAlpha(205);
      } else if (quizModel.answerState == 2) {
        return appColors.errorContainer.withAlpha(205);
      } else {
        return appColors.primary.withAlpha(75);
      }
    }

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => CorrectAnswerItem(model: quizModel),
        );
      },
      borderRadius: AppStyles.mainBorder,
      child: Container(
        decoration: BoxDecoration(
          color: cardColor(),
          borderRadius: AppStyles.mainBorder,
        ),
        child: Center(
          child: Text(
            quizModel.id.toString(),
          ),
        ),
      ),
    );
  }
}
