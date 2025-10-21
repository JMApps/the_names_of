import 'package:flutter/material.dart';

import '../../../core/strings/app_strings.dart';
import '../../settings/settings_column.dart';
import '../lists/content_chapters_list.dart';
import '../lists/content_pages_list.dart';

class MainContentPage extends StatelessWidget {
  const MainContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.descriptionHeads),
        actions: [
          IconButton(
            onPressed: () {
              /// Bottom sheet with content chapters
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                useSafeArea: true,
                builder: (context) => ContentChaptersList(),
              );
            },
            tooltip: AppStrings.chapters,
            icon: const Icon(
              Icons.view_headline_sharp,
            ),
          ),
          IconButton(
            onPressed: () {
              /// Bottom sheet with content settings
              showModalBottomSheet(
                context: context,
                builder: (context) => SettingsColumn(),
              );
            },
            tooltip: AppStrings.settings,
            icon: const Icon(
              Icons.settings_outlined,
            ),
          ),
        ],
      ),
      body: const ContentPagesList(),
    );
  }
}
