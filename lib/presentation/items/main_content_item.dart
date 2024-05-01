import 'package:flutter/material.dart';

import '../../application/styles/app_styles.dart';
import '../../data/models/arguments/main_args.dart';
import '../../domain/entities/content_entity.dart';
import '../widgets/base_html_widget.dart';

class MainContentItem extends StatelessWidget {
  const MainContentItem({
    super.key,
    required this.contentEntity,
    required this.contentIndex,
  });

  final ContentEntity contentEntity;
  final int contentIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppStyles.mainMardingMini,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            'main_contents_page',
            arguments: MainArgs(index: contentIndex),
          );
        },
        borderRadius: AppStyles.mainBorder,
        child: Padding(
          padding: AppStyles.mainMarding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.orange.withOpacity(0.75),
                    child: Text(
                      contentEntity.id.toString(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      contentEntity.contentTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: BaseHtmlWidget(
                  content: contentEntity.content,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
