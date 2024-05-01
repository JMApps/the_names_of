import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/data/repositories/book_content_data_repository.dart';
import 'package:the_names_of/domain/models/name_entity.dart';
import 'package:the_names_of/presentation/items/clarification_name_item.dart';

class ClarificationNamesList extends StatelessWidget {
  const ClarificationNamesList({super.key, required this.clarificationId});

  final int clarificationId;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return FutureBuilder<List<NameEntity>>(
      future: BookContentDataRepository().getChapterNames(chapterId: clarificationId),
      builder: (BuildContext context, AsyncSnapshot<List<NameEntity>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final NameEntity model = snapshot.data![index];
              return ClarificationNameItem(model: model);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: AppStyles.mainMarding,
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(
                  color: appColors.error,
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
