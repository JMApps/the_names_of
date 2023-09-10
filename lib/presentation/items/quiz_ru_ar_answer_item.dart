import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/application/state/quiz_ru_ar_state.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/application/themes/app_theme.dart';
import 'package:the_names_of/domain/models/arguments/quiz_mode_args.dart';
import 'package:the_names_of/domain/models/quiz_model.dart';

class QuizRuArAnswerItem extends StatelessWidget {
  const QuizRuArAnswerItem({
    super.key,
    required this.model,
    required this.index,
  });

  final QuizModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final QuizRuArState quizState = Provider.of<QuizRuArState>(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    Color answerColor() {
      if (model.correct == index && !quizState.isClickedAnswer) {
        return appColors.correctColor;
      } else if (model.correct != index && !quizState.isClickedAnswer && index == quizState.selectedAnswerIndex) {
        return appColors.incorrectColor;
      } else {
        return appColors.primary.withOpacity(0.25);
      }
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: !quizState.isClickedAnswer ? null : () {
          quizState.answer(model: model, index: index);
          if (model.id == 99 && model.answerState > 0) {
            Navigator.pushNamed(
              context,
              'quiz_score_page',
              arguments: QuizModeArgs(quizMode: 2),
            );
          }
        },
        borderRadius: AppStyles.mainBorder,
        child: Container(
          padding: AppStyles.mainMarding,
          decoration: BoxDecoration(
            borderRadius: AppStyles.mainBorder,
            color: answerColor(),
          ),
          child: Text(
            model.answers[index],
            style: const TextStyle(
              fontFamily: 'Khebrat',
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
