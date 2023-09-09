import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/quiz_model.dart';
import 'package:the_names_of/presentation/widgets/quiz_ru_ar_answer_item.dart';

class RuArQuizItem extends StatelessWidget {
  const RuArQuizItem({super.key, required this.model, required this.index});

  final QuizModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Padding(
      padding: AppStyles.mainMardingHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: appColors.inversePrimary,
            child: Padding(
              padding: AppStyles.mainMarding,
              child: Text(
                model.question,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
    );
  }
}