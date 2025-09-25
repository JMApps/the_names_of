import 'package:flutter/material.dart';
import 'package:the_names_of/application/strings/app_strings.dart';

import '../../application/routes/route_names.dart';
import '../../application/styles/app_styles.dart';
import '../../data/models/arguments/index_args.dart';
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
            RouteNames.mainContentsPage,
            arguments: IndexArgs(index: contentIndex),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.orange.withAlpha(205),
                    child: Text(
                      contentEntity.id.toString(),
                      style: TextStyle(
                        fontFamily: AppStrings.fontGilroy,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      contentEntity.contentTitle,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.arrow_forward_ios_rounded),
                  const SizedBox(width: 16),
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
