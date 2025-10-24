import 'package:flutter/material.dart';

import '../../core/styles/app_styles.dart';

class MainQuizCard extends StatelessWidget {
  const MainQuizCard({
    super.key,
    required this.quizTitle,
    required this.routeName,
  });

  final String quizTitle;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        contentPadding: AppStyles.mainMardingMini,
        visualDensity: VisualDensity.compact,
        splashColor: appColors.inversePrimary,
        tileColor: appColors.primaryContainer.withAlpha(105),
        shape: AppStyles.mainShape,
        title: Text(
          quizTitle,
          textAlign: TextAlign.center,
        ),
        leading: Icon(Icons.translate_rounded),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
