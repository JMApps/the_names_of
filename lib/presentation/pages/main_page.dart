import 'package:flutter/material.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/themes/app_theme.dart';
import 'package:the_names_of/presentation/lists/main_clarification_pages.dart';
import 'package:the_names_of/presentation/lists/main_content_pages.dart';
import 'package:the_names_of/presentation/lists/main_names_pages.dart';
import 'package:the_names_of/presentation/widgets/last_card.dart';
import 'package:the_names_of/presentation/widgets/main_page_item_to.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          const MainPageItemTo(
            routeName: 'main_contents_page',
            title: AppStrings.descriptionHeads,
          ),
          const MainContentPages(),
          const MainPageItemTo(
            routeName: 'main_names_page',
            title: AppStrings.names,
          ),
          const MainNamesPages(),
          const MainPageItemTo(
            routeName: 'main_clarifications_page',
            title: AppStrings.clarificationNames,
          ),
          const MainClarificationPages(),
          LastCard(
            title: AppStrings.quiz,
            routeName: '',
            cardColor: appColors.quizCardColor,
          ),
          const SizedBox(height: 16),
          LastCard(
            title: AppStrings.cards,
            routeName: '',
            cardColor: appColors.cardsColor,
          ),
        ],
      ),
    );
  }
}