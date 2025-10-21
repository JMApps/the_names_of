import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/name_entity.dart';
import '../../state/card_names_state.dart';
import 'back_name_card.dart';
import 'front_name_card.dart';

class CardNameItem extends StatelessWidget {
  const CardNameItem({
    super.key,
    required this.model,
    required this.index,
  });

  final NameEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<CardNamesState>(
      builder: (context, cardNamesState, _) {
        return FlipCard(
          front: cardNamesState.isFlipCard
              ? FrontNameCard(
                  model: model,
                  index: index,
                )
              : BackNameCard(
                  model: model,
                  index: index,
                ),
          back: cardNamesState.isFlipCard
              ? BackNameCard(
                  model: model,
                  index: index,
                )
              : FrontNameCard(
                  model: model,
                  index: index,
                ),
        );
      },
    );
  }
}
