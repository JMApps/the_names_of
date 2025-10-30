import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/core/strings/app_strings.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/quiz_entity.dart';
import '../../state/quiz_ru_ar_state.dart';

class QuizRuArAnswerItem extends StatelessWidget {
  const QuizRuArAnswerItem({
    super.key,
    required this.model,
    required this.index,
  });

  final QuizEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final QuizRuArState quizState = Provider.of<QuizRuArState>(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color correctAnswerColor = Colors.teal.withAlpha(155);
    final Color incorrectAnswerColor = Colors.red.withAlpha(155);

    Color answerColor() {
      if (model.correct == index && !quizState.isClickedAnswer) {
        return correctAnswerColor;
      } else if (model.correct != index && !quizState.isClickedAnswer && index == quizState.selectedAnswerIndex) {
        return incorrectAnswerColor;
      } else {
        return appColors.primary.withAlpha(25);
      }
    }

    return InkWell(
      onTap: !quizState.isClickedAnswer ? null : () {
        quizState.answer(model: model, index: index);
        if (quizState.toScorePage) {
          Navigator.pushNamed(
            context,
            RouteNames.quizScorePage,
            arguments: 2,
          );
        }
      },
      borderRadius: AppStyles.mainBorder,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        padding: AppStyles.mainMarding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: AppStyles.mainBorder,
          border: Border.all(
            color: answerColor(),
            width: 2.5,
          ),
        ),
        child: Text(
          model.answers[index],
          style: const TextStyle(
            fontFamily: AppStrings.fontHafs,
            fontSize: 30.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
