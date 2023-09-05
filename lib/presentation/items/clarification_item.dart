import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/application/themes/app_theme.dart';
import 'package:the_names_of/domain/models/clarification_model.dart';
import 'package:the_names_of/presentation/widgets/base_html_widget.dart';

class ClarificationItem extends StatelessWidget {
  const ClarificationItem({
    super.key,
    required this.model,
  });

  final ClarificationModel model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
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
              Card(
                color: appColors.clarificationCardColor,
                child: Padding(
                  padding: AppStyles.mainMardingMini,
                  child: Text(
                    model.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              BaseHtmlWidget(
                content: model.clarification,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
