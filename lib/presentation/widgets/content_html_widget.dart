import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/application/state/content_settings_state.dart';
import 'package:the_names_of/application/styles/app_styles.dart';

class ContentHtmlWidget extends StatelessWidget {
  const ContentHtmlWidget({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    final ContentSettingsState settings =
        Provider.of<ContentSettingsState>(context);
    return Html(
      data: content,
      style: {
        '#': Style(
          padding: HtmlPaddings.zero,
          margin: Margins.zero,
          fontSize: FontSize(settings.getTextSize),
          fontFamily: AppStyles.getFont[settings.getFontIndex],
          textAlign: AppStyles.getAlign[settings.getTextAlignIndex],
          color: appTheme.brightness == Brightness.dark
              ? settings.getDarkTextColor
              : settings.getLightTextColor,
        ),
        'small': Style(
          fontSize: FontSize(14),
          color: Colors.grey,
        ),
      },
    );
  }
}
