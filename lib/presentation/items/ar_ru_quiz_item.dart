import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/quiz_model.dart';
import 'package:the_names_of/presentation/items/quiz_ar_ru_answer_item.dart';

class ArRuQuizItem extends StatelessWidget {
  const ArRuQuizItem({super.key, required this.model, required this.index});

  final QuizModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return ListView(
      padding: AppStyles.mainMardingHorizontal,
      children: [
        Card(
          color: appColors.inversePrimary,
          child: Padding(
            padding: AppStyles.mainMarding,
            child: Text(
              model.question,
              style: const TextStyle(
                fontFamily: 'Khebrat',
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