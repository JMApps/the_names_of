import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/core/strings/app_strings.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/content_entity.dart';
import '../../state/content_state.dart';

class ContentListItem extends StatelessWidget {
  const ContentListItem({
    super.key,
    required this.contentModel,
    required this.index,
  });

  final ContentEntity contentModel;
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
        tileColor: Provider.of<ContentState>(context, listen: false).contentPage == index ? appColors.inversePrimary : index.isEven ? itemOddColor : itemEvenColor,
        onTap: () {
          Provider.of<ContentState>(context, listen: false).toPage(index);
          Navigator.pop(context);
        },
        title: Text(
          contentModel.contentTitle,
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: AppStrings.fontGilroy,
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: appColors.secondary.withAlpha(35),
          child: Padding(
            padding: AppStyles.mardingTopMicro,
            child: Text(
              contentModel.id.toString(),
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: AppStrings.fontGilroy,
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
