import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/clarification_entity.dart';
import '../../state/clarification_state.dart';

class ClarificationChapterItem extends StatelessWidget {
  const ClarificationChapterItem({
    super.key,
    required this.clarificationModel,
    required this.index,
  });

  final ClarificationEntity clarificationModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final itemOddColor = appColors.primary.withAlpha(10);
    final itemEvenColor = appColors.primary.withAlpha(25);
    return Padding(
      padding: AppStyles.mardingBottomOnlyMini,
      child: ListTile(
        contentPadding: AppStyles.mainMarding,
        shape: AppStyles.mainShape,
        tileColor: Provider.of<ClarificationState>(context, listen: false).clarificationPage == index ? appColors.inversePrimary : index.isEven ? itemOddColor : itemEvenColor,
        onTap: () {
          Navigator.pop(context);
          Provider.of<ClarificationState>(context, listen: false).toPage(index);
        },
        title: Text(
          clarificationModel.title,
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: AppStrings.fontGilroy,
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: appColors.secondary.withAlpha(35),
          radius: 17.5,
          child: Padding(
            padding: AppStyles.mardingTopMicro,
            child: Text(
              clarificationModel.id.toString(),
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: AppStrings.fontGilroy,
                color: appColors.secondary,
              ),
            ),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: appColors.secondary,
        ),
      ),
    );
  }
}
