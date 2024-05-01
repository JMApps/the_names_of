import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/arguments/main_args.dart';
import 'package:the_names_of/domain/models/content_entity.dart';
import 'package:the_names_of/presentation/widgets/base_html_widget.dart';

class MainContentItem extends StatelessWidget {
  const MainContentItem(
      {super.key, required this.model, required this.contentIndex,});

  final ContentModel model;
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
                      model.id.toString(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      model.contentTitle,
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
                  content: model.content,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
