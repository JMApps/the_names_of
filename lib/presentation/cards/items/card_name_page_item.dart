import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/name_entity.dart';
import '../../state/card_names_state.dart';
import 'back_name_page_card.dart';
import 'front_name_page_card.dart';

class CardNamePageItem extends StatelessWidget {
  const CardNamePageItem({
    super.key,
    required this.nameModel,
    required this.index,
  });

  final NameEntity nameModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<CardNamesState>(
      builder: (context, cardNamesState, _) {
        return Padding(
          padding: AppStyles.mainMardingMini,
          child: FlipCard(
            front: cardNamesState.isFlipCard
                ? FrontNamePageCard(
                    model: nameModel,
                    index: index,
                  )
                : BackNamePageCard(
                    model: nameModel,
                    index: index,
                  ),
            back: cardNamesState.isFlipCard
                ? BackNamePageCard(
                    model: nameModel,
                    index: index,
                  )
                : FrontNamePageCard(
                    model: nameModel,
                    index: index,
                  ),
          ),
        );
      },
    );
  }
}
