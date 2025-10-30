import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../settings/settings_column.dart';
import '../../state/content_clarification_state.dart';
import '../../state/content_state.dart';
import '../lists/content_chapters_list.dart';
import '../lists/content_pages_list.dart';

class MainContentPage extends StatelessWidget {
  const MainContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContentState(Provider.of<ContentClarificationState>(context, listen: false).contentPage),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.descriptionHeads),
          actions: [
            Consumer<ContentState>(
              builder: (context, contentState, _) {
                return IconButton(
                  onPressed: () {
                    /// Bottom sheet with content chapters
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useSafeArea: true,
                      builder: (context) => ChangeNotifierProvider.value(
                        value: contentState,
                        child: ContentChaptersList(
                          contentState: contentState,
                        ),
                      ),
                    );
                  },
                  tooltip: AppStrings.chapters,
                  icon: const Icon(
                    Icons.view_headline_rounded,
                  ),
                );
              },
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
                Icons.settings_rounded,
              ),
            ),
          ],
        ),
        body: const ContentPagesList(),
      ),
    );
  }
}
