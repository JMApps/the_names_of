import 'package:flutter/material.dart';

import '../../core/routes/route_names.dart';
import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../names/lists/root_names_page_list.dart';
import '../widgets/main_quiz_card.dart';
import '../widgets/main_screen_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.appName,
        ),
        actions: [
          IconButton(
            onPressed: () {
              /// Share app links
            },
            tooltip: AppStrings.share,
            icon: Icon(
              Icons.ios_share_rounded,
              color: appColors.primary,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: RootNamesPageList(),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: AppStyles.mardingBottomOnly,
              child: Row(
                spacing: 16,
                children: [
                  const SizedBox(),
                  Expanded(
                    child: MainScreenItem(
                      routeName: RouteNames.mainContentsPage,
                      title: AppStrings.descriptionHeads,
                      isIndicator: true,
                      pageNumber: 50,
                    ),
                  ),
                  Expanded(
                    child: MainScreenItem(
                      routeName: RouteNames.mainClarificationsPage,
                      title: AppStrings.clarification,
                      isIndicator: true,
                      pageNumber: 78,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: AppStyles.mardingBottomOnly,
              child: Row(
                spacing: 16,
                children: [
                  const SizedBox(),
                  Expanded(
                    child: MainScreenItem(
                      routeName: RouteNames.mainNamesPage,
                      title: AppStrings.names,
                      isIndicator: false,
                      pageNumber: 0,
                    ),
                  ),
                  Expanded(
                    child: MainScreenItem(
                      routeName: RouteNames.cardsNamePage,
                      title: AppStrings.cards,
                      isIndicator: false,
                      pageNumber: 0,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          ),
          Card(
            color: appColors.inversePrimary,
            margin: AppStyles.mainMardingHorizontal,
            child: Padding(
              padding: AppStyles.mainMardingMini,
              child: Text(
                AppStrings.quiz,
                style: AppStyles.mainTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: AppStyles.mardingVertical,
            child: Row(
              spacing: 16,
              children: [
                const SizedBox(),
                Expanded(
                  child: MainQuizCard(
                    quizTitle: AppStrings.arabicRussian,
                    routeName: RouteNames.arRuQuizPage,
                  ),
                ),
                Expanded(
                  child: MainQuizCard(
                    quizTitle: AppStrings.russianArabic,
                    routeName: RouteNames.ruArQuizPage,
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
