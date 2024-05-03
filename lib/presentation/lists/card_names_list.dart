import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../application/state/main_data_state.dart';
import '../../application/state/main_names_state.dart';
import '../../application/styles/app_styles.dart';
import '../../domain/entities/name_entity.dart';
import '../items/card_name_item.dart';
import '../widgets/error_data_text.dart';

class CardNamesList extends StatelessWidget {
  const CardNamesList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NameEntity>>(
      future: Provider.of<MainDataState>(context, listen: false).getBookContentUseCase.fetchAllNames(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          snapshot.data!.shuffle();
          return ScrollablePositionedList.builder(
            itemScrollController: Provider.of<MainNamesState>(context, listen: false).getItemScrollController,
            padding: AppStyles.mainMardingMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final NameEntity model = snapshot.data![index];
              return CardNamesItem(
                model: model,
                index: index,
              );
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
