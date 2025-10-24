import 'package:flutter/material.dart';
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
            onPressed: () {},
            tooltip: AppStrings.share,
            icon: Icon(
              Icons.ios_share_rounded,
              color: appColors.primary,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: AppStyles.mainMarding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8,
          children: [
            Card(
              child: SizedBox(
                height: 100.0,
                child: Text(
                  'Толкование',
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.mainNamesPage);
              },
              color: appColors.primaryContainer,
              shape: AppStyles.mainShape,
              child: Text('Имена'),
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
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Padding(
                    padding: AppStyles.mardingWithoutTop,
                  ),
                );
              },
              color: appColors.primaryContainer,
              shape: AppStyles.mainShape,
              child: Text('Викторина'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.cardsNamePage);
              },
              color: appColors.primaryContainer,
              shape: AppStyles.mainShape,
              child: Text('Карточки'),
            ),
            Row(
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
          ],
        ),
      ),
    );
  }
}
