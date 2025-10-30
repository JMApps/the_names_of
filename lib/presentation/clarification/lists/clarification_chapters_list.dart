import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/clarification_entity.dart';
import '../../state/clarification_state.dart';
import '../../state/content_clarification_state.dart';
import '../../state/main_content_state.dart';
import '../../widgets/error_data_text.dart';
import '../items/clarification_chapter_item.dart';

class ClarificationChaptersList extends StatefulWidget {
  const ClarificationChaptersList({
    super.key,
    required this.clarificationState,
  });

  final ClarificationState clarificationState;

  @override
  State<ClarificationChaptersList> createState() => _ClarificationChaptersListState();
}

class _ClarificationChaptersListState extends State<ClarificationChaptersList> {
  bool _scrolledOnce = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<MainContentState>(context, listen: false).getAllClarifications(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorDataText(textData: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          if (!_scrolledOnce) {
            _scrolledOnce = true;
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              final clarificationPage = Provider.of<ContentClarificationState>(context, listen: false).clarificationPage;
              await Future.delayed(const Duration(milliseconds: 50));
              if (widget.clarificationState.itemScrollController.isAttached && clarificationPage > 5) {
                widget.clarificationState.scrollToPage(clarificationPage: clarificationPage);
              }
            });
          }

          return ScrollablePositionedList.builder(
            itemScrollController: Provider.of<ClarificationState>(context, listen: false).itemScrollController,
            padding: AppStyles.mardingWithoutTopMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final ClarificationEntity clarificationModel = snapshot.data![index];
              return ClarificationChapterItem(
                clarificationModel: clarificationModel,
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
