import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/clarification_entity.dart';
import '../lists/clarification_ayahs_list.dart';
import '../lists/clarification_names_list.dart';
import '../../widgets/content_html_widget.dart';

class ClarificationItem extends StatelessWidget {
  const ClarificationItem({
    super.key,
    required this.clarificationModel,
  });

  final ClarificationEntity clarificationModel;

  @override
  Widget build(BuildContext context) {
    return SelectableRegion(
      focusNode: FocusNode(),
      selectionControls: Platform.isIOS ? CupertinoTextSelectionControls() : MaterialTextSelectionControls(),
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          padding: AppStyles.mainMardingHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClarificationNamesList(clarificationId: clarificationModel.id),
              ClarificationAyahsList(clarificationId: clarificationModel.id),
              ContentHtmlWidget(content: clarificationModel.clarification),
            ],
          ),
        ),
      ),
    );
  }
}
