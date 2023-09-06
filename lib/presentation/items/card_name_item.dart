import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/name_model.dart';

class CardNamesItem extends StatelessWidget {
  const CardNamesItem({super.key, required this.model});

  final NameModel model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color oddItemColor = appColors.primary.withOpacity(0.05);
    final Color evenItemColor = appColors.primary.withOpacity(0.15);
    return FlipCard(
      front: Container(
        padding: AppStyles.mainMarding,
        decoration: BoxDecoration(
          borderRadius: AppStyles.mainBorder,
          color: model.id.isOdd ? oddItemColor : evenItemColor,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: model.id.isOdd ? oddItemColor : evenItemColor,
                child: Text(
                  model.id.toString(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                model.nameArabic,
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Khebrat',
                  color: appColors.secondary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      back: Container(
        padding: AppStyles.mainMarding,
        decoration: BoxDecoration(
          borderRadius: AppStyles.mainBorder,
          color: model.id.isOdd ? oddItemColor : evenItemColor,
        ),
        child: Stack(
          children: [
            Padding(
              padding: AppStyles.mainMardingHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    model.nameTranscription,
                    style: TextStyle(
                      color: appColors.primary,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    model.nameTranslation,
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: model.id.isOdd ? oddItemColor : evenItemColor,
                child: Text(
                  model.id.toString(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
