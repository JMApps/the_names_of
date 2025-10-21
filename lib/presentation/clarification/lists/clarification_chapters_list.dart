import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/clarification_entity.dart';
import '../../state/main_content_state.dart';
import '../../widgets/error_data_text.dart';
import '../items/clarification_chapter_item.dart';

class ClarificationChaptersList extends StatelessWidget {
  const ClarificationChaptersList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<MainContentState>(context, listen: false).getAllClarifications(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorDataText(textData: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return ListView.builder(
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
