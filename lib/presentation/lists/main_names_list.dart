import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_names_of/application/state/main_names_state.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/data/local/database_query.dart';
import 'package:the_names_of/domain/models/name_model.dart';
import 'package:the_names_of/presentation/items/main_name_item.dart';

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
    return FutureBuilder<List<NameModel>>(
      future: DatabaseQuery().getAllNames(),
      builder: (BuildContext context, AsyncSnapshot<List<NameModel>> snapshot) {
        if (snapshot.hasData) {
          return ScrollablePositionedList.builder(
            itemScrollController: mainNamesState.getItemScrollController,
            padding: AppStyles.mainMardingMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final NameModel model = snapshot.data![index];
              return MainNamesItem(model: model);
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
