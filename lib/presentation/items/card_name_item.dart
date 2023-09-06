import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/application/state/main_names_state.dart';
import 'package:the_names_of/domain/models/name_model.dart';
import 'package:the_names_of/presentation/widgets/back_name_card.dart';
import 'package:the_names_of/presentation/widgets/front_name_card.dart';

class CardNamesItem extends StatelessWidget {
  const CardNamesItem({super.key, required this.model});

  final NameModel model;

  @override
  Widget build(BuildContext context) {
    final MainNamesState namesState = Provider.of<MainNamesState>(context);
    return FlipCard(
      front: namesState.getIsFlipCard ? FrontNameCard(model: model) : BackNameCard(model: model),
      back: namesState.getIsFlipCard ? BackNameCard(model: model) : FrontNameCard(model: model),
    );
  }
}
