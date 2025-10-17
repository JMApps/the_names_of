import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/ayah_entity.dart';
import '../../items/main_ayah_item.dart';
import '../../state/main_content_state.dart';

class ClarificationAyahsList extends StatelessWidget {
  const ClarificationAyahsList({super.key, required this.clarificationId});

  final int clarificationId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AyahEntity>>(
      future: Provider.of<MainContentState>(context, listen: false).getChapterAyahs(chapterId: clarificationId),
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
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
