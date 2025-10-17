import 'package:flutter/material.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/content_entity.dart';
import '../../widgets/content_html_widget.dart';

class ContentItem extends StatelessWidget {
  const ContentItem({
    super.key,
    required this.contentModel,
  });

  final ContentEntity contentModel;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Scrollbar(
      child: ListView(
        padding: AppStyles.mainMarding,
        children: [
          Card(
            child: Padding(
              padding: AppStyles.mainMardingMini,
              child: Text(
                contentModel.contentTitle,
                style: TextStyle(
                  fontSize: 18.0,
                  color: appColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ContentHtmlWidget(
            content: contentModel.content,
          ),
        ],
      ),
    );
  }
}
