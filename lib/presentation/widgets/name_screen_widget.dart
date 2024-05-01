import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/name_entity.dart';

class NameScreenWidget extends StatelessWidget {
  const NameScreenWidget({super.key, required this.model});

  final NameEntity model;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              model.nameArabic,
              style: const TextStyle(
                fontSize: 22,
                fontFamily: 'Khebrat',
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              model.nameTranscription,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Gilroy',
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              model.nameTranslation,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Gilroy',
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
