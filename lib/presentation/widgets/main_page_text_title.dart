import 'package:flutter/material.dart';

class MainPageTextTitle extends StatelessWidget {
  const MainPageTextTitle({
    super.key,
    required this.text,
    required this.textColor,
  });

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Gilroy',
          color: textColor,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
