import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/content_entity.dart';
import '../../state/content_state.dart';
import '../../state/main_content_state.dart';
import '../../widgets/error_data_text.dart';
import '../items/content_item.dart';

class ContentPagesList extends StatelessWidget {
  const ContentPagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ContentEntity>>(
      future: Provider.of<MainContentState>(context, listen: false).getAllContents(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorDataText(textData: snapshot.error.toString());
        }
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Consumer<ContentState>(
            builder: (context, clarificationState, _) {
              return Column(
                children: [
                  Padding(
                    padding: AppStyles.mainMardingHorizontal,
                    child: LinearProgressIndicator(
                      minHeight: 6,
                      value: clarificationState.contentPage / 15,
                      year2023: false,
                    ),
                  ),
                  const SizedBox(height: 4),
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
                        clarificationState.contentPage = pageIndex!;
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
    );
  }
}
