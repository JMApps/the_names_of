import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/content_entity.dart';
import '../../state/clarification_state.dart';
import '../../state/main_content_state.dart';
import '../../widgets/error_data_text.dart';
import '../items/content_item.dart';

class ContentPagesList extends StatelessWidget {
  const ContentPagesList({
    super.key,
    required this.contentIndex,
  });

  final int contentIndex;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ClarificationState(contentIndex),
        ),
      ],
      child: FutureBuilder<List<ContentEntity>>(
        future: Provider.of<MainContentState>(context, listen: false).getAllContents(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorDataText(textData: snapshot.error.toString());
          }
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Consumer<ClarificationState>(
              builder: (context, clarificationState, _) {
                return Column(
                  children: [
                    Padding(
                      padding: AppStyles.mainMardingHorizontal,
                      child: LinearProgressIndicator(
                        minHeight: 6,
                        value: clarificationState.clarificationPage / 15,
                        year2023: false,
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                        controller: clarificationState.pageController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final ContentEntity contentModel = snapshot.data![index];
                          return ContentItem(
                            contentModel: contentModel,
                          );
                        },
                        onPageChanged: (int? pageIndex) {
                          clarificationState.clarificationPage = pageIndex!;
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
    );
  }
}
