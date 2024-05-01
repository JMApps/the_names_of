import 'package:flutter/material.dart';

import '../../data/repositories/book_content_data_repository.dart';
import '../../domain/entities/ayah_entity.dart';
import '../../domain/usecases/book_content_use_case.dart';
import '../items/main_ayah_item.dart';

class ClarificationAyahsList extends StatelessWidget {
  const ClarificationAyahsList({super.key, required this.clarificationId});

  final int clarificationId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AyahEntity>>(
      future: BookContentUseCase(BookContentDataRepository()).fetchChapterAyahs(chapterId: clarificationId),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final AyahEntity ayahModel = snapshot.data![index];
              return MainAyahItem(ayahModel: ayahModel);
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
