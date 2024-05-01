import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/application/state/content_settings_state.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/name_entity.dart';

class ClarificationNameItem extends StatelessWidget {
  const ClarificationNameItem({super.key, required this.model});

  final NameEntity model;

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
            color: model.id.isOdd ? oddItemColor : evenItemColor,
            borderRadius: AppStyles.mainBorder,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor:
                      model.id.isOdd ? evenItemColor : appColors.background,
                  child: Text(model.id.toString()),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      model.nameArabic,
                      style: TextStyle(
                        fontSize: settings.getTextSize + 3,
                        fontFamily: 'Khebrat',
                        color: appColors.secondary,
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      model.nameTranscription,
                      style: TextStyle(
                        fontSize: settings.getTextSize,
                        color: appColors.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      model.nameTranslation,
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
