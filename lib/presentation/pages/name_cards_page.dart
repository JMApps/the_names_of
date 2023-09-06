import 'package:flutter/material.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/presentation/lists/card_names_list.dart';

class NameCardsPage extends StatelessWidget {
  const NameCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.cards),
        backgroundColor: appColors.inversePrimary,
      ),
      body: const CardNamesList(),
    );
  }
}
