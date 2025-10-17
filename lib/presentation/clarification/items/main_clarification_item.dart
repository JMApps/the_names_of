import 'package:flutter/material.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/clarification_entity.dart';
import '../../widgets/base_html_widget.dart';

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
            RouteNames.mainClarificationsPage,
            arguments: clarificationIndex,
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
                    backgroundColor: Colors.green.withAlpha(205),
                    child: Text(
                      clarificationModel.id.toString(),
                      style: TextStyle(
                        fontFamily: AppStrings.fontGilroy,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      clarificationModel.title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.arrow_forward_ios_rounded),
                  const SizedBox(width: 16),
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
