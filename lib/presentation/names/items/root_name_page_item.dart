import 'package:flutter/material.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/name_entity.dart';

class RootNamePageItem extends StatelessWidget {
  const RootNamePageItem({
    super.key,
    required this.nameModel,
  });

  final NameEntity nameModel;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mardingWithoutTopMini,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4,
            children: [
              Text(
                nameModel.nameArabic,
                style: TextStyle(
                  fontSize: 45.0,
                  fontFamily: AppStrings.fontHafs,
                  color: appColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                nameModel.nameTranscription,
                style: TextStyle(
                  color: appColors.secondary,
                  fontSize: 17.5,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                nameModel.nameTranslation,
                style: TextStyle(
                  fontSize: 21.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(),
              CircleAvatar(
                radius: 17.5,
                backgroundColor: appColors.secondary.withAlpha(35),
                child: Padding(
                  padding: AppStyles.mardingTopMicro,
                  child: Text(
                    nameModel.id.toString(),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: AppStrings.fontGilroy,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
