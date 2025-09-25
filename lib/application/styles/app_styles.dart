import 'package:flutter/material.dart';

class AppStyles {
  static const RoundedRectangleBorder mainShape = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.5)));
  static const BorderRadius mainBorder = BorderRadius.all(Radius.circular(12.5));

  static const EdgeInsets mainMarding = EdgeInsets.all(16);
  static const EdgeInsets mainMardingMini = EdgeInsets.all(8);

  static const EdgeInsets mainMardingHorizontal = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets mainMardingHorizontalMini = EdgeInsets.symmetric(horizontal: 8);

  static const EdgeInsets mainMardingVertical = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets mainMardingVerticalMini = EdgeInsets.symmetric(vertical: 8);

  static const List<String> textFonts = [
    'Gilroy',
    'Montserrat',
    'Raleway',
  ];

  static const List<TextAlign> textAligns = [
    TextAlign.left,
    TextAlign.center,
    TextAlign.right,
    TextAlign.justify,
  ];
}
