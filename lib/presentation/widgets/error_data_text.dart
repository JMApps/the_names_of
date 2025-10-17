import 'package:flutter/material.dart';

import '../../core/styles/app_styles.dart';

class ErrorDataText extends StatelessWidget {
  const ErrorDataText({
    super.key,
    required this.textData,
  });

  final String textData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.mainMarding,
      alignment: Alignment.center,
      child: Text(
        textData,
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).colorScheme.error,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
