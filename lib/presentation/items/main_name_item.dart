import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/name_model.dart';
import 'package:the_names_of/presentation/widgets/main_names_modal.dart';

class MainNamesItem extends StatelessWidget {
  const MainNamesItem({super.key, required this.model});

  final NameModel model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const MainNamesModal(),
            );
          },
          borderRadius: AppStyles.mainBorder,
          child: Container(
            padding: AppStyles.mainMarding,
            decoration: BoxDecoration(
              color: model.id.isOdd ? oddItemColor : evenItemColor,
              borderRadius: AppStyles.mainBorder,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor:
                        model.id.isOdd ? evenItemColor : colorScheme.background,
                    child: Text(model.id.toString()),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor:
                        model.id.isOdd ? evenItemColor : colorScheme.background,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.play_circle),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        model.nameArabic,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Khebrat',
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        model.nameTranscription,
                        style: const TextStyle(
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        model.nameTranslation,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
