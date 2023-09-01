import 'package:flutter/cupertino.dart';

class AppStyles {
  static const RoundedRectangleBorder appBarShare = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.elliptical(25, 35),
      bottomLeft: Radius.elliptical(25, 35),
    ),
  );
}
