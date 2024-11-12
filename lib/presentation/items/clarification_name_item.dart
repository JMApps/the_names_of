import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/state/content_settings_state.dart';
import '../../application/styles/app_styles.dart';
import '../../domain/entities/name_entity.dart';

class ClarificationNameItem extends StatelessWidget {
  const ClarificationNameItem({
    super.key,
    required this.nameModel,
  });

  final NameEntity nameModel;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color oddItemColor = appColors.primary.withOpacity(0.05);
    final Color evenItemColor = appColors.primary.withOpacity(0.15);
    final ContentSettingsState settings = Provider.of<ContentSettingsState>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: AppStyles.mainMarding,
          decoration: BoxDecoration(
            color: nameModel.id.isOdd ? oddItemColor : evenItemColor,
            borderRadius: AppStyles.mainBorder,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor:
                  nameModel.id.isOdd ? evenItemColor : appColors.surface,
                  child: Text(nameModel.id.toString()),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      nameModel.nameArabic,
                      style: TextStyle(
                        fontSize: settings.getTextSize + 5,
                        fontFamily: 'Scheherezade',
                        color: appColors.primary,
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      nameModel.nameTranscription,
                      style: TextStyle(
                        fontSize: settings.getTextSize,
                        color: appColors.secondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      nameModel.nameTranslation,
                      style: TextStyle(
                        fontSize: settings.getTextSize,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
