import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/route_names.dart';
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
    final QuizArRuState quizState = Provider.of<QuizArRuState>(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    Color answerColor() {
      if (model.correct == index && !quizState.isClickedAnswer) {
        return appColors.inversePrimary;
      } else if (model.correct != index &&
          !quizState.isClickedAnswer &&
          index == quizState.selectedAnswerIndex) {
        return appColors.errorContainer;
      } else {
        return appColors.primary.withAlpha(75);
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
                    RouteNames.quizScorePage,
                    arguments: 1,
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
              fontFamily: 'Montserrat',
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
