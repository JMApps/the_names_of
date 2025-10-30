import 'package:flutter/material.dart';

import '../../core/styles/app_styles.dart';

class MainScreenItem extends StatelessWidget {
  const MainScreenItem({
    super.key,
    required this.routeName,
    required this.title,
    required this.isIndicator,
    required this.totalPages,
    required this.pageNumber,
  });

  final String routeName;
  final String title;

  final bool isIndicator;
  final int totalPages;
  final int pageNumber;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      child: InkWell(
        borderRadius: AppStyles.mainBorder,
        splashColor: appColors.inversePrimary,
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Row(
                spacing: 16,
                children: [
                  const SizedBox(),
                  Expanded(
                    child: Text(
                      title,
                      style: AppStyles.mainTextStyle,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded),
                  const SizedBox(),
                ],
              ),
            ),
            Visibility(
              visible: isIndicator,
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: AppStyles.mardingWithoutTop,
                  child: LinearProgressIndicator(
                    backgroundColor: appColors.secondaryContainer,
                    minHeight: 6,
                    borderRadius: AppStyles.mainBorder,
                    value: pageNumber / totalPages,
                    year2023: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
