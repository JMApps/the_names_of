import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/styles/app_styles.dart';

class MainNamesModal extends StatelessWidget {
  const MainNamesModal({super.key});

  @override
  Widget build(BuildContext context) {
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
              },
              title: const Text(AppStrings.copy),
              leading: const Icon(CupertinoIcons.doc_on_doc),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: const Text(AppStrings.share),
              leading: const Icon(CupertinoIcons.share),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: const Text(AppStrings.sharePicture),
              leading: const Icon(CupertinoIcons.photo_on_rectangle),
            ),
          ],
        ),
      ),
    );
  }
}
