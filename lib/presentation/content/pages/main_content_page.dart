import 'package:flutter/material.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/strings/app_strings.dart';
import '../lists/content_pages_list.dart';

class MainContentPage extends StatelessWidget {
  const MainContentPage({super.key, required this.contentIndex});

  final int contentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.descriptionHeads),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.appSettingsPage);
            },
            tooltip: AppStrings.settings,
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: ContentPagesList(contentIndex: contentIndex),
    );
  }
}
