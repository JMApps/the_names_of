import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_names_of/application/state/main_names_state.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/data/repositories/book_content_data_repository.dart';
import 'package:the_names_of/domain/models/name_entity.dart';
import 'package:the_names_of/presentation/items/card_name_item.dart';

class CardNamesList extends StatefulWidget {
  const CardNamesList({super.key});

  @override
  State<CardNamesList> createState() => _CardNamesListState();
}

class _CardNamesListState extends State<CardNamesList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NameEntity>>(
      future: BookContentDataRepository().getAllNames(),
      builder: (BuildContext context, AsyncSnapshot<List<NameEntity>> snapshot) {
        if (snapshot.hasData) {
          snapshot.data!.shuffle();
          return ScrollablePositionedList.builder(
            itemScrollController: context.read<MainNamesState>().getItemScrollController,
            padding: AppStyles.mainMardingMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final NameEntity model = snapshot.data![index];
              return CardNamesItem(model: model, index: index);
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
