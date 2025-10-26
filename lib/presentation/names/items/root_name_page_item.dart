import 'package:flutter/material.dart';

import '../../../core/routes/route_names.dart';
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
      margin: AppStyles.mardingHorVerMini,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, RouteNames.mainNamesPage);
        },
        contentPadding: AppStyles.mainMarding,
        visualDensity: VisualDensity.standard,
        splashColor: appColors.inversePrimary,
        tileColor: appColors.primaryContainer.withAlpha(105),
        shape: AppStyles.mainShape,
        title: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameModel.nameArabic,
                style: TextStyle(
                  fontSize: 22.0,
                  fontFamily: AppStrings.fontHafs,
                  color: appColors.primary,
                ),
                textAlign: TextAlign.end,
              ),
              Text(
                nameModel.nameTranscription,
                style: TextStyle(
                  color: appColors.secondary,
                  fontSize: 16.5,
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                nameModel.nameTranslation,
                style: TextStyle(
                  fontSize: 16.5,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        trailing: Padding(
          padding: AppStyles.mardingBottomOnlyMini,
          child: Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    );
  }
}
