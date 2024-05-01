import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../application/styles/app_styles.dart';
import '../../domain/entities/content_entity.dart';
import '../widgets/content_html_widget.dart';

class ContentItem extends StatelessWidget {
  const ContentItem({
    super.key,
    required this.contentModel,
  });

  final ContentEntity contentModel;

  @override
  Widget build(BuildContext context) {
    return SelectableRegion(
      focusNode: FocusNode(),
      selectionControls: Platform.isIOS
          ? CupertinoTextSelectionControls()
          : MaterialTextSelectionControls(),
      child: CupertinoScrollbar(
        child: ListView(
          padding: AppStyles.mainMardingHorizontal,
          children: [
            Card(
              child: Padding(
                padding: AppStyles.mainMardingMini,
                child: Text(
                  contentModel.contentTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 8),
            ContentHtmlWidget(
              content: contentModel.content,
            ),
          ],
        ),
      ),
    );
  }
}
