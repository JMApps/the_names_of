import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_names_of/application/state/main_names_state.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/data/local/database_query.dart';
import 'package:the_names_of/domain/models/name_model.dart';
import 'package:the_names_of/presentation/items/card_name_item.dart';
import 'package:the_names_of/presentation/items/main_name_item.dart';

class CardNamesList extends StatelessWidget {
  const CardNamesList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NameModel>>(
      future: DatabaseQuery().getAllNames(),
      builder: (BuildContext context, AsyncSnapshot<List<NameModel>> snapshot) {
        if (snapshot.hasData) {
          return ScrollablePositionedList.builder(
            itemScrollController: context.read<MainNamesState>().getItemScrollController,
            padding: AppStyles.mainMardingMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final NameModel model = snapshot.data![index];
              return CardNamesItem(model: model);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: AppStyles.mainMarding,
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(
                  color: Colors.red,
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
