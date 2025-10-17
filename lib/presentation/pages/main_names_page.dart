import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/strings/app_strings.dart';
import '../names/lists/main_names_list.dart';
import '../state/app_player_state.dart';
import '../state/main_names_state.dart';

class MainNamesPage extends StatelessWidget {
  const MainNamesPage({super.key, required this.nameIndex});

  final int nameIndex;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppPlayerState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.names),
          actions: [
            Consumer<MainNamesState>(
              builder: (context, namesState, widget) {
                return IconButton(
                  onPressed: () {
                    namesState.toDefaultItem();
                  },
                  tooltip: AppStrings.defaultName,
                  icon: const Icon(
                    Icons.recycling,
                  ),
                );
              },
            ),
          ],
        ),
        body: MainNamesList(nameIndex: nameIndex),
      ),
    );
  }
}
