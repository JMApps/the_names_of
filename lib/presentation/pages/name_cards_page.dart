import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/strings/app_strings.dart';
import '../lists/card_names_list.dart';
import '../state/app_player_state.dart';
import '../state/main_names_state.dart';

class NameCardsPage extends StatelessWidget {
  const NameCardsPage({super.key});

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
          title: const Text(AppStrings.cards),
          actions: [
            IconButton(
              onPressed: () {
                context.read<MainNamesState>().toListDefaultItem();
              },
              icon: const Icon(
                Icons.recycling,
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<MainNamesState>().changeFlipCard;
              },
              icon: const Icon(
                CupertinoIcons.creditcard_fill,
              ),
            ),
          ],
        ),
        body: const CardNamesList(),
      ),
    );
  }
}
