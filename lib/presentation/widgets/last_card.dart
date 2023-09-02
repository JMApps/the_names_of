import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';

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
        onTap: () {},
        borderRadius: AppStyles.mainBorder,
        child: Padding(
          padding: AppStyles.mainMarding,
          child: Text(title),
        ),
      ),
    );
  }
}
