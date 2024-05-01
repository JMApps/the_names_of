import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/content_entity.dart';
import 'package:the_names_of/presentation/widgets/content_html_widget.dart';

class ContentItem extends StatelessWidget {
  const ContentItem({
    super.key,
    required this.model,
  });

  final ContentModel model;

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
                  model.contentTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 8),
            ContentHtmlWidget(
              content: model.content,
            ),
          ],
        ),
      ),
    );
  }
}
