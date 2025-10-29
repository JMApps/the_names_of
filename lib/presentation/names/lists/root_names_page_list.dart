import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/name_entity.dart';
import '../../state/main_content_state.dart';
import '../../widgets/error_data_text.dart';
import '../items/root_name_page_item.dart';

class RootNamesPageList extends StatefulWidget {
  const RootNamesPageList({super.key});

  @override
  State<RootNamesPageList> createState() => _RootNamesPageListState();
}

class _RootNamesPageListState extends State<RootNamesPageList> {
  final PageController _mainNamesController = PageController(viewportFraction: 0.90);
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
          return PageView.builder(
            controller: _mainNamesController,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final nameModel = snapshot.data![index];
              return RootNamePageItem(nameModel: nameModel);
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
