import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/ayah_entity.dart';
import '../../state/main_content_state.dart';
import '../items/clarification_ayah_item.dart';

class ClarificationAyahsList extends StatefulWidget {
  const ClarificationAyahsList({
    super.key,
    required this.clarificationId,
  });

  final int clarificationId;

  @override
  State<ClarificationAyahsList> createState() => _ClarificationAyahsListState();
}

class _ClarificationAyahsListState extends State<ClarificationAyahsList> {
  late final Future<List<AyahEntity>> _futureAyahs;

  @override
  void initState() {
    super.initState();
    _futureAyahs = Provider.of<MainContentState>(context, listen: false).getChapterAyahs(chapterId: widget.clarificationId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AyahEntity>>(
      future: _futureAyahs,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Visibility(
                visible: snapshot.data!.isNotEmpty,
                child: Padding(
                  padding: AppStyles.mardingHorBottomMini,
                  child: Text(
                    snapshot.data!.length > 1 ? AppStrings.ayahs : AppStrings.ayah,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: AppStyles.mainMardingHorizontal,
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final AyahEntity ayahModel = snapshot.data![index];
                  return ClarificationAyahItem(ayahModel: ayahModel);
                },
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
