import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainNamesState extends ChangeNotifier {
  final ItemScrollController _itemScrollController = ItemScrollController();

  ItemScrollController get getItemScrollController => _itemScrollController;

  final Random random = Random();

  toDefaultItem() {
    if (_itemScrollController.isAttached) {
      _itemScrollController.scrollTo(
        index: random.nextInt(99),
        duration: const Duration(
          milliseconds: 750,
        ),
      );
    }
  }

  toIdItem(int id) {
    if (_itemScrollController.isAttached) {
      _itemScrollController.scrollTo(
        index: id,
        duration: const Duration(
          milliseconds: 750,
        ),
      );
    }
  }
}
