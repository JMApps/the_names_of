import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../../core/styles/app_styles.dart';
import '../state/content_settings_state.dart';

class ContentHtmlWidget extends StatelessWidget {
  const ContentHtmlWidget({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    return Consumer<ContentSettingsState>(
      builder: (context, contentSettingsState, _) {
        return Html(
          data: content,
          style: {
            '#': Style(
              padding: HtmlPaddings.all(8),
              margin: Margins.zero,
              fontSize: FontSize(contentSettingsState.textSize),
              fontFamily: AppStyles.textFonts[contentSettingsState.fontIndex],
              textAlign: AppStyles.textAligns[contentSettingsState.textAlignIndex],
              color: appTheme.brightness == Brightness.dark ? contentSettingsState.darkTextColor : contentSettingsState.lightTextColor,
            ),
            'small': Style(
              fontSize: FontSize(14),
              color: appTheme.colorScheme.secondary,
            ),
          },
        );
      },
    );
  }
}
