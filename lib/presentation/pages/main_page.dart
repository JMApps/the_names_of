import 'package:flutter/material.dart';

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
        title: Text(AppStrings.appName),
      ),
      body: Padding(
        padding: AppStyles.mainMarding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.mainContentsPage);
              },
              color: appColors.primaryContainer,
              shape: AppStyles.mainShape,
              child: Text('Изложение основ'),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RouteNames.arRuQuizPage);
                          },
                          child: Text('AR-RU'),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RouteNames.ruArQuizPage);
                          },
                          child: Text('RU-AR'),
                        ),
                      ],
                    ),
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
          ],
        ),
      ),
    );
  }
}
