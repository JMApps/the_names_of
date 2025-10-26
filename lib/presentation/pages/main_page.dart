import 'package:flutter/material.dart';
import 'package:the_names_of/presentation/names/lists/root_names_page_list.dart';
import 'package:the_names_of/presentation/widgets/main_quiz_card.dart';

import '../../core/routes/route_names.dart';
import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';

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
              /// Shape app links
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
        spacing: 8,
        children: [
          Card(
            child: SizedBox(
              height: 100.0,
              child: Center(
                child: Text(
                  'Разъяснение основ',
                  style: AppStyles.mainTextStyle,
                ),
              ),
            ),
          ),
          Card(
            shape: AppStyles.rightShape,
            margin: AppStyles.mardingRightOnly,
            color: appColors.inversePrimary,
            child: Padding(
              padding: AppStyles.mainMardingMini,
              child: Text(
                AppStrings.names,
                style: AppStyles.mainTextStyle,
              ),
            ),
          ),
          SizedBox(
            height: 150.0,
            child: RootNamesPageList(),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.mainClarificationsPage);
            },
            color: appColors.primaryContainer,
            shape: AppStyles.mainShape,
            child: Text('Толкование'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.cardsNamePage);
            },
            color: appColors.primaryContainer,
            shape: AppStyles.mainShape,
            child: Text('Карточки'),
          ),
          Card(
            shape: AppStyles.rightShape,
            margin: AppStyles.mardingRightOnly,
            color: appColors.inversePrimary,
            child: Padding(
              padding: AppStyles.mainMardingMini,
              child: Text(
                AppStrings.quiz,
                style: AppStyles.mainTextStyle,
              ),
            ),
          ),
          Padding(
            padding: AppStyles.mardingHorVerMini,
            child: Row(
              children: [
                Expanded(
                  child: MainQuizCard(
                    quizTitle: AppStrings.arabicRussian,
                    routeName: RouteNames.arRuQuizPage,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: MainQuizCard(
                    quizTitle: AppStrings.russianArabic,
                    routeName: RouteNames.ruArQuizPage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
