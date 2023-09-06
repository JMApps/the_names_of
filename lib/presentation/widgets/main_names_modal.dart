import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/application/state/main_names_state.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/name_model.dart';

class MainNamesModal extends StatelessWidget {
  const MainNamesModal({super.key, required this.model});

  final NameModel model;

  @override
  Widget build(BuildContext context) {
    final MainNamesState namesState = context.read<MainNamesState>();
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: AppStyles.mainMarding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
                namesState.copyContent = names();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(milliseconds: 350),
                    content: Text(
                      AppStrings.copied,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Gilroy',
                        color: Colors.white,
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
                namesState.shareContent = names();
              },
              title: const Text(AppStrings.share),
              leading: const Icon(CupertinoIcons.share),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                namesState.takeScreenshot(model);
              },
              title: const Text(AppStrings.sharePicture),
              leading: const Icon(CupertinoIcons.photo_on_rectangle),
            ),
          ],
        ),
      ),
    );
  }

  String names() =>
      '${model.nameArabic}\n${model.nameTranscription}\n${model.nameTranslation}';
}
