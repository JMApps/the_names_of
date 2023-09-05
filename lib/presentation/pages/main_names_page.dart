import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/application/state/main_names_state.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/themes/app_theme.dart';
import 'package:the_names_of/presentation/lists/main_names_list.dart';

class MainNamesPage extends StatelessWidget {
  const MainNamesPage({super.key, required this.nameIndex});

  final int nameIndex;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainNamesState(),
        ),
      ],
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: Container(
            decoration: BoxDecoration(
              gradient: appColors.namesGradient,
            ),
            child: AppBar(
              title: const Text(AppStrings.names),
              backgroundColor: Colors.transparent,
              actions: [
                Consumer<MainNamesState>(
                  builder: (context, namesState, widget) {
                    return IconButton(
                      onPressed: () {
                        namesState.toDefaultItem();
                      },
                      tooltip: AppStrings.defaultName,
                      icon: const Icon(CupertinoIcons.arrow_2_squarepath),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: MainNamesList(nameIndex: nameIndex),
      ),
    );
  }
}
