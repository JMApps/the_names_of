import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/application/themes/app_theme.dart';
import 'package:the_names_of/domain/models/clarification_model.dart';
import 'package:the_names_of/presentation/widgets/base_html_widget.dart';

class MainClarificationItem extends StatelessWidget {
  const MainClarificationItem({super.key, required this.model});

  final ClarificationModel model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mainMarding,
      color: appColors.clarificationCardColor,
      child: InkWell(
        onTap: () {},
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
                    backgroundColor: Colors.green.withOpacity(0.75),
                    child: Text(
                      model.id.toString(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      model.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: BaseHtmlWidget(
                  content: model.clarification,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
