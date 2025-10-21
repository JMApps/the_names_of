import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../state/app_player_state.dart';
import '../../state/card_names_state.dart';
import '../lists/card_names_page_list.dart';
import '../lists/cards_name_list.dart';

class CardsNamePage extends StatelessWidget {
  const CardsNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppPlayerState(),
        ),
      ],
      child: Consumer<CardNamesState>(
        builder: (context, cardNamesState, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.cards),
              actions: [
                IconButton(
                  onPressed: () {
                    cardNamesState.changePageMode;
                  },
                  tooltip: AppStrings.defaultName,
                  icon: Icon(
                    cardNamesState.pageMode ? Icons.list_alt_rounded : Icons.menu_book,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (cardNamesState.pageMode) {
                      cardNamesState.toPageDefaultItem();
                    } else {
                      cardNamesState.toListDefaultItem();
                    }
                  },
                  icon: const Icon(
                    Icons.shuffle,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cardNamesState.changeFlipCard;
                  },
                  icon: Icon(
                    Icons.change_circle_outlined,
                  ),
                ),
              ],
            ),
            body: cardNamesState.pageMode ? CardNamesPageList() : CardsNameList(),
          );
        },
      ),
    );
  }
}
