import 'package:flutter/material.dart';
import 'package:the_names_of/data/repositories/book_content_data_repository.dart';
import 'package:the_names_of/domain/entities/ayah_entity.dart';
import 'package:the_names_of/presentation/items/main_ayah_item.dart';

class ClarificationAyahsList extends StatelessWidget {
  const ClarificationAyahsList({super.key, required this.clarificationId});

  final int clarificationId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AyahModel>>(
      future: BookContentDataRepository().getChapterAyahs(chapterId: clarificationId),
      builder: (BuildContext context, AsyncSnapshot<List<AyahModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final AyahModel model = snapshot.data![index];
              return MainAyahItem(model: model);
            },
          );
        } else if (snapshot.hasError) {
          return const SizedBox();
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
