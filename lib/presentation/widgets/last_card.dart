import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/presentation/widgets/select_quiz.dart';

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
    return Card(
      margin: AppStyles.mainMardingHorizontal,
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
        child: Padding(
          padding: AppStyles.mainMarding,
          child: Text(title),
        ),
      ),
    );
  }
}
