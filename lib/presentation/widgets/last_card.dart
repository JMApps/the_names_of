import 'package:flutter/material.dart';

import '../../application/styles/app_styles.dart';
import 'select_quiz.dart';

class LastCard extends StatelessWidget {
  const LastCard({
    super.key,
    required this.title,
    required this.routeName,
  });

  final String title;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          if (routeName == 'quiz') {
            showModalBottomSheet(
              context: context,
              builder: (_) => const SelectQuiz(),
            );
          } else {
            Navigator.pushNamed(context, routeName);
          }
        },
        borderRadius: AppStyles.mainBorder,
        child: Container(
          padding: AppStyles.mainMardingMini,
          decoration: BoxDecoration(
            borderRadius: AppStyles.mainBorder,
            color: appColors.primary.withAlpha(75),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
