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
    return Card(
      margin: AppStyles.mardingBottomOnlyMini,
      child: Padding(
        padding: AppStyles.mainMarding,
        child: Consumer<ContentSettingsState>(
          builder: (context, contentSettingsState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 8,
              children: [
                Text(
                  ayahModel.ayahArabic,
                  style: TextStyle(
                    fontSize: contentSettingsState.textSize + 5,
                    fontFamily: AppStrings.fontHafs,
                    color: appColors.secondary,
                    height: 1.75,
                  ),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
                Text(
                  ayahModel.ayahTranslation,
                  style: TextStyle(
                    fontSize: contentSettingsState.textSize,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  ayahModel.ayahSource,
                  style: TextStyle(
                    fontSize: contentSettingsState.textSize - 6,
                    fontFamily: AppStrings.fontGilroy,
                    color: appColors.secondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
