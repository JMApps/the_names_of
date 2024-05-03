import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/state/main_data_state.dart';
import '../../domain/entities/name_entity.dart';
import '../items/clarification_name_item.dart';
import '../widgets/error_data_text.dart';

class ClarificationNamesList extends StatelessWidget {
  const ClarificationNamesList({
    super.key,
    required this.clarificationId,
  });

  final int clarificationId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NameEntity>>(
      future: Provider.of<MainDataState>(context, listen: false).getBookContentUseCase.fetchChapterNames(chapterId: clarificationId),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final NameEntity nameModel = snapshot.data![index];
              return ClarificationNameItem(nameModel: nameModel);
            },
          );
        } else if (snapshot.hasError) {
          return ErrorDataText(textData: snapshot.error.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
