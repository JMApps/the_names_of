import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/name_entity.dart';
import '../../state/main_names_state.dart';
import '../items/card_name_item.dart';
import '../../state/main_content_state.dart';
import '../../widgets/error_data_text.dart';

class CardsNameList extends StatefulWidget {
  const CardsNameList({super.key});

  @override
  State<CardsNameList> createState() => _CardsNameListState();
}

class _CardsNameListState extends State<CardsNameList> {
  late final Future<List<NameEntity>> _futureNames;

  @override
  void initState() {
    super.initState();
    _futureNames = _loadAndShuffleNames();
  }

  Future<List<NameEntity>> _loadAndShuffleNames() async {
    final mainContentState = Provider.of<MainContentState>(context, listen: false);
    final namesList = await mainContentState.getAllNames();

    if (namesList.isNotEmpty) {
      namesList.shuffle(Random());
    }

    return namesList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NameEntity>>(
      future: _futureNames,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorDataText(textData: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          snapshot.data!.shuffle();
          return ScrollablePositionedList.builder(
            itemScrollController: Provider.of<MainNamesState>(context, listen: false).itemScrollController,
            padding: AppStyles.mardingWithoutTopMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final NameEntity model = snapshot.data![index];
              return CardNameItem(
                model: model,
                index: index,
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
