import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/clarification_entity.dart';
import '../../widgets/content_html_widget.dart';
import '../lists/clarification_ayahs_list.dart';
import '../lists/clarification_names_list.dart';

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
      selectionControls: Platform.isAndroid ? MaterialTextSelectionControls() : CupertinoTextSelectionControls(),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClarificationNamesList(clarificationId: clarificationModel.id),
              ClarificationAyahsList(clarificationId: clarificationModel.id),
              Padding(
                padding: AppStyles.mardingHorVerMicro,
                child: Text(
                  AppStrings.clarification,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: AppStyles.mardingWithoutTop,
                child: ContentHtmlWidget(content: clarificationModel.clarification),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
