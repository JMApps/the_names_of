import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/clarification_entity.dart';
import '../../settings/settings_column.dart';
import '../../state/app_player_state.dart';
import '../../state/clarification_state.dart';
import '../../state/content_clarification_state.dart';
import '../../state/main_content_state.dart';
import '../../widgets/error_data_text.dart';
import '../items/clarification_item.dart';
import '../lists/clarification_chapters_list.dart';

class MainClarificationPage extends StatelessWidget {
  const MainClarificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ClarificationState(Provider.of<ContentClarificationState>(context, listen: false).clarificationPage),
        ),
        ChangeNotifierProvider(
          create: (_) => AppPlayerState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.clarificationNames),
          actions: [
            Consumer<ClarificationState>(
              builder: (context, clarificationState, _) {
                return IconButton(
                  onPressed: () {
                    /// Bottom sheet with clarification chapters
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useSafeArea: true,
                      builder: (context) => ChangeNotifierProvider.value(
                        value: clarificationState,
                        child: ClarificationChaptersList(
                          clarificationState: clarificationState,
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
                /// Bottom sheet with clarification settings
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
        body: FutureBuilder<List<ClarificationEntity>>(
          future: Provider.of<MainContentState>(context, listen: false).getAllClarifications(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ErrorDataText(textData: snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return Consumer2<ClarificationState, ContentClarificationState>(
                builder: (context, clarificationState, contentClarificationState, _) {
                  return Column(
                    children: [
                      Padding(
                        padding: AppStyles.mainMardingHorizontal,
                        child: LinearProgressIndicator(
                          minHeight: 6,
                          borderRadius: AppStyles.mainBorder,
                          value: contentClarificationState.clarificationPage / 64,
                          year2023: false,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: PageView.builder(
                          controller: clarificationState.pageController,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final ClarificationEntity clarificationModel = snapshot.data![index];
                            return ClarificationItem(clarificationModel: clarificationModel);
                          },
                          onPageChanged: (int page) {
                            contentClarificationState.clarificationPage = page;
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }
}
