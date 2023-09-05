import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/application/themes/app_theme.dart';
import 'package:the_names_of/domain/models/arguments/main_args.dart';
import 'package:the_names_of/domain/models/content_model.dart';
import 'package:the_names_of/presentation/widgets/base_html_widget.dart';

class MainContentItem extends StatelessWidget {
  const MainContentItem({super.key, required this.model});

  final ContentModel model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mainMarding,
      color: appColors.contentCardColor,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            'main_contents_page',
            arguments: MainArgs(model.id - 1),
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
                mainAxisAlignment: MainAxisAlignment.start,
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
