import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/name_model.dart';

class MainNamesItem extends StatelessWidget {
  const MainNamesItem({super.key, required this.model});

  final NameModel model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            color: model.id.isOdd ? oddItemColor : evenItemColor,
            borderRadius: AppStyles.mainBorder,
          ),
          child: InkWell(
            onTap: () {},
            borderRadius: AppStyles.mainBorder,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
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
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
