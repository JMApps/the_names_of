import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/name_entity.dart';
import '../../state/main_names_state.dart';

class MainNamesModal extends StatelessWidget {
  const MainNamesModal({
    super.key,
    required this.model,
    required this.mainNamesState,
  });

  final NameEntity model;
  final MainNamesState mainNamesState;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Padding(
      padding: AppStyles.mardingWithoutTop,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () {
              Navigator.pop(context);
              mainNamesState.copyContent = names();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: appColors.primary,
                  duration: Duration(milliseconds: 350),
                  content: Text(
                    AppStrings.copied,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: AppStrings.fontGilroy,
                    ),
                  ),
                ),
              );
            },
            title: const Text(AppStrings.copy),
            leading: const Icon(CupertinoIcons.doc_on_doc),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              mainNamesState.shareContent = names();
            },
            title: const Text(AppStrings.shareText),
            leading: const Icon(CupertinoIcons.share),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              mainNamesState.takeScreenshot(model);
            },
            title: const Text(AppStrings.sharePicture),
            leading: const Icon(CupertinoIcons.photo_on_rectangle),
          ),
        ],
      ),
    );
  }

  String names() => '${model.nameArabic}\n${model.nameTranscription}\n${model.nameTranslation}';
}
