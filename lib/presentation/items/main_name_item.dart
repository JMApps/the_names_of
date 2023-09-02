import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/application/themes/app_theme.dart';
import 'package:the_names_of/domain/models/name_model.dart';

class MainNamesItem extends StatelessWidget {
  const MainNamesItem({super.key, required this.model});

  final NameModel model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      color: appColors.namesColor50,
      margin: AppStyles.mainMarding,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 16,
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.red.withOpacity(0.75),
                child: Text(model.id.toString()),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  model.nameArabic,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Khebrat',
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  model.nameTranscription,
                  style: const TextStyle(
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  model.nameTranslation,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
