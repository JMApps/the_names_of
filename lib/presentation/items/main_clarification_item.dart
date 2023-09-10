import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/arguments/main_args.dart';
import 'package:the_names_of/domain/models/clarification_model.dart';
import 'package:the_names_of/presentation/widgets/base_html_widget.dart';

class MainClarificationItem extends StatelessWidget {
  const MainClarificationItem({
    super.key,
    required this.model,
    required this.clarificationIndex,
  });

  final ClarificationModel model;
  final int clarificationIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppStyles.mainMardingMini,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            'main_clarifications_page',
            arguments: MainArgs(index: clarificationIndex),
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
