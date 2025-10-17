import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/name_entity.dart';
import '../state/main_names_state.dart';
import '../widgets/back_name_card.dart';
import '../widgets/front_name_card.dart';

class CardNamesItem extends StatelessWidget {
  const CardNamesItem({super.key, required this.model, required this.index});

  final NameEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final MainNamesState namesState = Provider.of<MainNamesState>(context);
    return FlipCard(
      front: namesState.getIsFlipCard ? FrontNameCard(model: model, index: index) : BackNameCard(model: model, index: index),
      back: namesState.getIsFlipCard ? BackNameCard(model: model, index: index) : FrontNameCard(model: model, index: index),
    );
  }
}
