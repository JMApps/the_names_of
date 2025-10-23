import 'package:flutter/material.dart';
import 'package:the_names_of/core/strings/app_strings.dart';

class AppStyles {
  static const RoundedRectangleBorder mainShape = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.5)));
  static const RoundedRectangleBorder bigShape = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)));
  static const RoundedRectangleBorder rightShape = RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(12.5), bottomRight: Radius.circular(12.5)));
  static const BorderRadius mainBorder = BorderRadius.all(Radius.circular(12.5));

  static const EdgeInsets mainMardingBig = EdgeInsets.all(24);
  static const EdgeInsets mainMarding = EdgeInsets.all(16);
  static const EdgeInsets mardingWithoutTop = EdgeInsets.only(left: 16, bottom: 16, right: 16);

  static const EdgeInsets mardingWithoutTopMini = EdgeInsets.only(left: 8, bottom: 8, right: 8);
  static const EdgeInsets mainMardingMini = EdgeInsets.all(8);
  static const EdgeInsets mainMardingMicro = EdgeInsets.all(4);
  static const EdgeInsets mardingHorVerMini = EdgeInsets.symmetric(vertical: 8, horizontal: 16);

  static const EdgeInsets mainMardingHorizontal = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets mainMardingHorizontalMini = EdgeInsets.symmetric(horizontal: 8);

  static const EdgeInsets mainMardingVertical = EdgeInsets.symmetric(vertical: 16);

  static const EdgeInsets mardingTopMicro = EdgeInsets.only(top: 4);
  static const EdgeInsets mardingBottomOnly = EdgeInsets.only(bottom: 16);
  static const EdgeInsets mardingBottomOnlyMini = EdgeInsets.only(bottom: 8);
  static const EdgeInsets mardingRightOnly = EdgeInsets.only(right: 16);

  static const mainTextStyle = TextStyle(
    fontSize: 18.0,
    fontFamily: AppStrings.fontRaleway,
  );

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
