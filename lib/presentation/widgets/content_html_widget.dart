import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../../application/state/content_settings_state.dart';
import '../../application/styles/app_styles.dart';

class ContentHtmlWidget extends StatelessWidget {
  const ContentHtmlWidget({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    final ContentSettingsState settings = Provider.of<ContentSettingsState>(context);
    return Html(
      data: content,
      style: {
        '#': Style(
          padding: HtmlPaddings.zero,
          margin: Margins.zero,
          fontSize: FontSize(settings.textSize),
          fontFamily: AppStyles.textFonts[settings.fontIndex],
          textAlign: AppStyles.textAligns[settings.textAlignIndex],
          color: appTheme.brightness == Brightness.dark
              ? settings.darkTextColor
              : settings.lightTextColor,
        ),
        'small': Style(
          fontSize: FontSize(14),
          color: Colors.grey,
        ),
      },
    );
  }
}
