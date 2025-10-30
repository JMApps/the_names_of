import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/name_entity.dart';
import '../../state/main_names_state.dart';
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
    return Consumer<MainNamesState>(
      builder: (context, mainNamesState, _) {
        return Padding(
          padding: AppStyles.mainMardingMini,
          child: FlipCard(
            front: mainNamesState.isFlipCard
                ? FrontNamePageCard(nameModel: nameModel, index: index)
                : BackNamePageCard(nameModel: nameModel, index: index),
            back: mainNamesState.isFlipCard
                ? BackNamePageCard(nameModel: nameModel, index: index)
                : FrontNamePageCard(nameModel: nameModel, index: index),
          ),
        );
      },
    );
  }
}
