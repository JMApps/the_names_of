import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/application/state/main_names_state.dart';
import 'package:the_names_of/domain/models/name_model.dart';
import 'package:the_names_of/presentation/widgets/back_name_card.dart';
import 'package:the_names_of/presentation/widgets/front_name_card.dart';

class CardNamesItem extends StatelessWidget {
  const CardNamesItem({super.key, required this.model, required this.index});

  final NameModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final MainNamesState namesState = Provider.of<MainNamesState>(context);
    return FlipCard(
      front: namesState.getIsFlipCard
          ? FrontNameCard(model: model, index: index)
          : BackNameCard(model: model, index: index),
      back: namesState.getIsFlipCard
          ? BackNameCard(model: model, index: index)
          : FrontNameCard(model: model, index: index),
    );
  }
}
