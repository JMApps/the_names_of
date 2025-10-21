import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/ayah_entity.dart';
import '../../state/content_settings_state.dart';

class ClarificationAyahItem extends StatelessWidget {
  const ClarificationAyahItem({
    super.key,
    required this.ayahModel,
  });

  final AyahEntity ayahModel;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Container(
      padding: AppStyles.mainMarding,
      margin: AppStyles.mardingWithoutTopMini,
      decoration: BoxDecoration(
        borderRadius: AppStyles.mainBorder,
        color: appColors.tertiary.withAlpha(15),
      ),
      child: Consumer<ContentSettingsState>(
        builder: (context, contentSettingsState, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                ayahModel.ayahArabic,
                style: TextStyle(
                  fontSize: contentSettingsState.textSize + 5,
                  fontFamily: AppStrings.fontHafs,
                  color: appColors.secondary,
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
              Text(
                ayahModel.ayahTranslation,
                style: TextStyle(
                  fontSize: contentSettingsState.textSize,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              Text(
                ayahModel.ayahSource,
                style: TextStyle(
                  fontSize: contentSettingsState.textSize - 6,
                  fontFamily: AppStrings.fontGilroy,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
