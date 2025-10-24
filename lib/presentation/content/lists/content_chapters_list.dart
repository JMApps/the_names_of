import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/content_entity.dart';
import '../../state/content_state.dart';
import '../../state/main_content_state.dart';
import '../../widgets/error_data_text.dart';
import '../items/content_chapter_item.dart';

class ContentChaptersList extends StatefulWidget {
  const ContentChaptersList({
    super.key,
    required this.contentState,
  });

  final ContentState contentState;

  @override
  State<ContentChaptersList> createState() => _ContentChaptersListState();
}

class _ContentChaptersListState extends State<ContentChaptersList> {
  bool _scrolledOnce = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ContentEntity>>(
      future: Provider.of<MainContentState>(context, listen: false).getAllContents(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorDataText(textData: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          if (!_scrolledOnce) {
            _scrolledOnce = true;
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await Future.delayed(const Duration(milliseconds: 50));
              if (widget.contentState.itemScrollController.isAttached) {
                widget.contentState.scrollToPage();
              }
            });
          }
          return ScrollablePositionedList.builder(
            itemScrollController: Provider.of<ContentState>(context, listen: false).itemScrollController,
            padding: AppStyles.mardingWithoutTopMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final ContentEntity contentModel = snapshot.data![index];
              return ContentChapterItem(
                contentModel: contentModel,
                index: index,
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
