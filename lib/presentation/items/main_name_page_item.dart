import 'package:flutter/material.dart';

import '../../application/styles/app_styles.dart';
import '../../data/models/arguments/main_args.dart';
import '../../domain/entities/name_entity.dart';

class MainNamesPageItem extends StatelessWidget {
  const MainNamesPageItem({
    super.key,
    required this.nameModel,
    required this.index,
  });

  final NameEntity nameModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mainMardingMini,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            'main_names_page',
            arguments: MainArgs(index: index),
          );
        },
        borderRadius: AppStyles.mainBorder,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                ),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.red.withOpacity(0.75),
                  child: Text(nameModel.id.toString()),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nameModel.nameArabic,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Khebrat',
                      color: appColors.secondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    nameModel.nameTranscription,
                    style: TextStyle(
                      color: appColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    nameModel.nameTranslation,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
