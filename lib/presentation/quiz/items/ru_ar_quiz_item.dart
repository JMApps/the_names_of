import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/quiz_entity.dart';
import 'quiz_ru_ar_answer_item.dart';

class RuArQuizItem extends StatelessWidget {
  const RuArQuizItem({
    super.key,
    required this.model,
    required this.index,
  });

  final QuizEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Card(
            shape: AppStyles.mainShape,
            margin: AppStyles.mainMardingHorizontal,
            child: Padding(
              padding: AppStyles.mainMarding,
              child: Center(
                child: Text(
                  model.question,
                  style: TextStyle(
                    fontFamily: AppStrings.fontMontserrat,
                    fontSize: 25.0,
                    color: appColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: SingleChildScrollView(
              child: ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

                  final crossAxisCount = isPortrait ? 1 : 4;
                  final childAspectRatio = isPortrait ? 4 : 1;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: AppStyles.mainMarding,
                    itemCount: model.answers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return QuizRuArAnswerItem(
                        model: model,
                        index: index,
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: childAspectRatio.toDouble(),
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
