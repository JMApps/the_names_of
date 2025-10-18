import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_names_of/core/strings/app_strings.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/content_entity.dart';
import '../../widgets/content_html_widget.dart';

class ContentItem extends StatelessWidget {
  const ContentItem({
    super.key,
    required this.contentModel,
  });

  final ContentEntity contentModel;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Scrollbar(
      child: SelectableRegion(
        selectionControls: Platform.isAndroid ? MaterialTextSelectionControls() : CupertinoTextSelectionControls(),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 12),
            Card(
              shape: AppStyles.rightShape,
              margin: AppStyles.mardingRightOnly,
              color: appColors.inversePrimary,
              elevation: 0,
              child: Padding(
                padding: AppStyles.mainMardingMini,
                child: Text(
                  '${contentModel.id}. ${contentModel.contentTitle}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: AppStrings.fontGilroy,
                    color: appColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ContentHtmlWidget(
              content: contentModel.content,
            ),
          ],
        ),
      ),
    );
  }
}
