import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/application/state/main_names_state.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/presentation/lists/main_names_list.dart';

class MainNamesPage extends StatelessWidget {
  const MainNamesPage({super.key, required this.nameIndex});

  final int nameIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                icon: const Icon(
                  CupertinoIcons.arrow_2_squarepath,
                ),
              );
            },
          ),
        ],
      ),
      body: MainNamesList(nameIndex: nameIndex),
    );
  }
}
