import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/ayah_model.dart';

class MainAyahItem extends StatelessWidget {
  const MainAyahItem({super.key, required this.model});

  final AyahModel model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color oddItemColor = appColors.secondary.withOpacity(0.05);
    final Color evenItemColor = appColors.secondary.withOpacity(0.15);
    return Container(
      padding: AppStyles.mainMarding,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: AppStyles.mainBorder,
        color: model.id.isOdd ? oddItemColor : evenItemColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            model.ayahArabic,
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Scheherezade',
              color: appColors.secondary,
            ),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
          Text(
            model.ayahTranslation,
            textAlign: TextAlign.center,
          ),
          Text(
            model.ayahSource,
            style: const TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
