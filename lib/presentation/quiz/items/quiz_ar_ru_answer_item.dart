import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/quiz_entity.dart';
import '../../state/quiz_ar_ru_state.dart';

class QuizArRuAnswerItem extends StatelessWidget {
  const QuizArRuAnswerItem({
    super.key,
    required this.model,
    required this.index,
  });

  final QuizEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final QuizArRuState quizState = Provider.of<QuizArRuState>(context, listen: false);
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
            arguments: 1,
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
            fontFamily: AppStrings.fontMontserrat,
            fontSize: 18.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
