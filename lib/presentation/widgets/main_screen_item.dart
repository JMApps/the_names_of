import 'package:flutter/material.dart';

import '../../core/styles/app_styles.dart';

class MainScreenItem extends StatelessWidget {
  const MainScreenItem({
    super.key,
    required this.routeName,
    required this.title,
    required this.isIndicator,
    required this.pageNumber,
  });

  final String routeName;
  final String title;

  final bool isIndicator;
  final int pageNumber;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      color: appColors.secondaryContainer,
      child: InkWell(
        borderRadius: AppStyles.mainBorder,
        splashColor: appColors.inversePrimary,
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: AppStyles.mardingTopOnly,
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
            ),
            Visibility(
              visible: isIndicator,
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              child: Padding(
                padding: AppStyles.mardingWithoutTop,
                child: LinearProgressIndicator(
                  minHeight: 6,
                  borderRadius: AppStyles.mainBorder,
                  backgroundColor: appColors.surface.withAlpha(155),
                  value: pageNumber / 99,
                  year2023: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
