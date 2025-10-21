import 'package:flutter/material.dart';
import 'package:the_names_of/core/strings/app_strings.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/name_entity.dart';

class NameScreenWidget extends StatelessWidget {
  const NameScreenWidget({
    super.key,
    required this.model,
  });

  final NameEntity model;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Text(
              model.nameArabic,
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: AppStrings.fontHafs,
                color: appColors.primary,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              model.nameTranscription,
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: AppStrings.fontGilroy,
                color: appColors.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              model.nameTranslation,
              style: const TextStyle(
                fontSize: 20.0,
                fontFamily: AppStrings.fontGilroy,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
