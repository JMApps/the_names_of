import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class BaseHtmlWidget extends StatelessWidget {
  const BaseHtmlWidget({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: content,
      style: {
        '#': Style(
          padding: HtmlPaddings.zero,
          margin: Margins.zero,
          fontSize: FontSize(18.0),
          textOverflow: TextOverflow.fade,
        ),
        'small': Style(
          fontSize: FontSize(14),
        ),
      },
    );
  }
}
