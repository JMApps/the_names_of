import 'package:flutter/material.dart';
import 'package:the_names_of/application/themes/app_theme.dart';

import '../../application/styles/app_styles.dart';
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
        return appColors.correctColor.withOpacity(0.75);
      } else if (quizModel.answerState == 2) {
        return appColors.incorrectColor.withOpacity(0.75);
      } else {
        return appColors.primary.withOpacity(0.25);
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
