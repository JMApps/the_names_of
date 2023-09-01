import 'package:flutter/cupertino.dart';

class AppStyles {
  static const RoundedRectangleBorder appBarShare = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.elliptical(25, 35),
      bottomLeft: Radius.elliptical(25, 35),
    ),
  );

  static const RoundedRectangleBorder mainShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25),
    ),
  );

  static const BorderRadius mainBorder = BorderRadius.all(
    Radius.circular(25),
  );

  static const EdgeInsets mainMarding = EdgeInsets.all(16);
  static const EdgeInsets mainMardingMini = EdgeInsets.all(8);
}
