import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/state/content_settings_state.dart';
import '../../application/styles/app_styles.dart';
import '../../domain/entities/ayah_entity.dart';

class MainAyahItem extends StatelessWidget {
  const MainAyahItem({super.key, required this.ayahModel});

  final AyahEntity ayahModel;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color oddItemColor = appColors.secondary.withAlpha(15);
    final Color evenItemColor = appColors.secondary.withAlpha(25);
    final ContentSettingsState settings = Provider.of<ContentSettingsState>(context);
    return Container(
      padding: AppStyles.mainMarding,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: AppStyles.mainBorder,
        color: ayahModel.id.isOdd ? oddItemColor : evenItemColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            ayahModel.ayahArabic,
            style: TextStyle(
              fontSize: settings.textSize + 10,
              fontFamily: 'Scheherezade',
              color: appColors.secondary,
            ),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
          Text(
            ayahModel.ayahTranslation,
            style: TextStyle(
              fontSize: settings.textSize,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            ayahModel.ayahSource,
            style: TextStyle(
              fontSize: settings.textSize - 6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
