import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../core/styles/app_styles.dart';
import '../../domain/entities/name_entity.dart';
import '../items/card_name_item.dart';
import '../state/main_content_state.dart';
import '../state/main_names_state.dart';
import '../widgets/error_data_text.dart';

class CardNamesList extends StatelessWidget {
  const CardNamesList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NameEntity>>(
      future: Provider.of<MainContentState>(context, listen: false).getAllNames(),
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
