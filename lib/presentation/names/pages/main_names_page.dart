import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../state/app_player_state.dart';
import '../../state/main_names_state.dart';
import '../lists/main_names_list.dart';
import '../lists/main_names_page_list.dart';

class MainNamesPage extends StatelessWidget {
  const MainNamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppPlayerState(),
        ),
      ],
      child: Consumer<MainNamesState>(
        builder: (context, mainNamesState, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.names),
              actions: [
                IconButton(
                  onPressed: () {
                    mainNamesState.changePageMode;
                  },
                  tooltip: AppStrings.defaultName,
                  icon: Icon(
                    mainNamesState.pageMode ? Icons.view_list_rounded : Icons.menu_book,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (mainNamesState.pageMode) {
                      mainNamesState.toPageDefaultItem();
                    } else {
                      mainNamesState.toListDefaultItem();
                    }
                  },
                  tooltip: AppStrings.defaultName,
                  icon: const Icon(
                    Icons.shuffle,
                  ),
                ),
              ],
            ),
            body: mainNamesState.pageMode ? MainNamesPageList() : MainNamesList(),
          );
        },
      ),
    );
  }
}
