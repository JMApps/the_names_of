import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/application/state/app_player_state.dart';
import 'package:the_names_of/application/state/main_names_state.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/presentation/lists/card_names_list.dart';

class NameCardsPage extends StatelessWidget {
  const NameCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppPlayerState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.cards),
          backgroundColor: appColors.inversePrimary,
          actions: [
            IconButton(
              onPressed: () {
                context.read<MainNamesState>().toDefaultItem();
              },
              icon: Icon(
                Icons.repeat_on,
                color: appColors.primary,
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<MainNamesState>().changeFlipCard();
              },
              icon: Icon(
                CupertinoIcons.creditcard_fill,
                color: appColors.primary,
              ),
            ),
          ],
        ),
        body: const CardNamesList(),
      ),
    );
  }
}
