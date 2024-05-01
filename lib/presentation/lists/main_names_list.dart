import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../application/state/main_names_state.dart';
import '../../application/styles/app_styles.dart';
import '../../data/repositories/book_content_data_repository.dart';
import '../../domain/entities/name_entity.dart';
import '../../domain/usecases/book_content_use_case.dart';
import '../items/main_name_item.dart';
import '../widgets/error_data_text.dart';

class MainNamesList extends StatefulWidget {
  const MainNamesList({super.key, required this.nameIndex});

  final int nameIndex;

  @override
  State<MainNamesList> createState() => _MainNamesListState();
}

class _MainNamesListState extends State<MainNamesList> {
  @override
  void initState() {
    if (widget.nameIndex > 1) {
      Future.delayed(const Duration(milliseconds: 250)).whenComplete(
        () => context.read<MainNamesState>().toIdItem(widget.nameIndex),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MainNamesState mainNamesState = Provider.of<MainNamesState>(context);
    return FutureBuilder<List<NameEntity>>(
      future: BookContentUseCase(BookContentDataRepository()).fetchAllNames(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return ScrollablePositionedList.builder(
            itemScrollController: mainNamesState.getItemScrollController,
            padding: AppStyles.mainMardingMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final NameEntity nameModel = snapshot.data![index];
              return MainNamesItem(nameModel: nameModel);
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
