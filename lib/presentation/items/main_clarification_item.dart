import 'package:flutter/material.dart';

import '../../application/styles/app_styles.dart';
import '../../data/models/arguments/main_args.dart';
import '../../domain/entities/clarification_entity.dart';
import '../widgets/base_html_widget.dart';

class MainClarificationItem extends StatelessWidget {
  const MainClarificationItem({
    super.key,
    required this.clarificationModel,
    required this.clarificationIndex,
  });

  final ClarificationEntity clarificationModel;
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
                      clarificationModel.id.toString(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      clarificationModel.title,
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
                  content: clarificationModel.clarification,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
