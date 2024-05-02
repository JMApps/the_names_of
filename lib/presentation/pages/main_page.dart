import 'package:flutter/material.dart';

import '../../application/routes/route_names.dart';
import '../../application/strings/app_strings.dart';
import '../../application/styles/app_styles.dart';
import '../items/main_page_item_to.dart';
import '../lists/main_clarification_pages.dart';
import '../lists/main_content_pages.dart';
import '../lists/main_names_pages.dart';
import '../widgets/last_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8),
            MainPageItemTo(
              routeName: RouteNames.mainContentsPage,
              title: AppStrings.descriptionHeads,
            ),
            MainContentPages(),
            MainPageItemTo(
              routeName: RouteNames.mainNamesPage,
              title: AppStrings.names,
            ),
            MainNamesPages(),
            MainPageItemTo(
              routeName: RouteNames.mainClarificationsPage,
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
                  routeName: RouteNames.nameCardsPage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
