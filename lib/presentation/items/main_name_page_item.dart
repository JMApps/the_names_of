import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/arguments/main_args.dart';
import 'package:the_names_of/domain/models/name_model.dart';

class MainNamesPageItem extends StatelessWidget {
  const MainNamesPageItem({
    super.key,
    required this.model,
    required this.index,
  });

  final NameModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mainMarding,
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
                  child: Text(model.id.toString()),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.nameArabic,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Khebrat',
                      color: appColors.secondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    model.nameTranscription,
                    style: TextStyle(
                      color: appColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    model.nameTranslation,
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
