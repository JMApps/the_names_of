import 'package:flutter/material.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/presentation/items/main_page_item_to.dart';
import 'package:the_names_of/presentation/lists/main_clarification_pages.dart';
import 'package:the_names_of/presentation/lists/main_content_pages.dart';
import 'package:the_names_of/presentation/lists/main_names_pages.dart';
import 'package:the_names_of/presentation/widgets/last_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        backgroundColor: appColors.inversePrimary,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8),
            MainPageItemTo(
              routeName: 'main_contents_page',
              title: AppStrings.descriptionHeads,
            ),
            MainContentPages(),
            MainPageItemTo(
              routeName: 'main_names_page',
              title: AppStrings.names,
            ),
            MainNamesPages(),
            MainPageItemTo(
              routeName: 'main_clarifications_page',
              title: AppStrings.clarificationNames,
            ),
            MainClarificationPages(),
          ],
        ),
      ),
      bottomNavigationBar: const Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: AppStyles.mainMardingMini,
          child: Row(
            children: [
              Expanded(
                child: LastCard(
                  title: AppStrings.quiz,
                  routeName: 'quiz',
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: LastCard(
                  title: AppStrings.cards,
                  routeName: 'name_cards_page',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
