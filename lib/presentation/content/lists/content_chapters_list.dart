import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/content_entity.dart';
import '../../state/main_content_state.dart';
import '../../widgets/error_data_text.dart';
import '../items/content_list_item.dart';

class ContentChaptersList extends StatelessWidget {
  const ContentChaptersList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ContentEntity>>(
      future: Provider.of<MainContentState>(context, listen: false).getAllContents(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorDataText(textData: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return ListView.builder(
            padding: AppStyles.mardingWithoutTopMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final ContentEntity contentModel = snapshot.data![index];
              return ContentListItem(
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
