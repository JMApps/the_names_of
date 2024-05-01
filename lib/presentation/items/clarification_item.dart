import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/entities/clarification_entity.dart';
import 'package:the_names_of/presentation/lists/clarification_ayahs_list.dart';
import 'package:the_names_of/presentation/lists/clarification_names_list.dart';
import 'package:the_names_of/presentation/widgets/content_html_widget.dart';

class ClarificationItem extends StatelessWidget {
  const ClarificationItem({
    super.key,
    required this.model,
  });

  final ClarificationModel model;

  @override
  Widget build(BuildContext context) {
    return SelectableRegion(
      focusNode: FocusNode(),
      selectionControls: Platform.isIOS
          ? CupertinoTextSelectionControls()
          : MaterialTextSelectionControls(),
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          padding: AppStyles.mainMardingHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClarificationNamesList(clarificationId: model.id),
              ClarificationAyahsList(clarificationId: model.id),
              ContentHtmlWidget(content: model.clarification),
            ],
          ),
        ),
      ),
    );
  }
}
