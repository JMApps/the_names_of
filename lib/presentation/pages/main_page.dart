import 'package:flutter/material.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/themes/app_theme.dart';
import 'package:the_names_of/presentation/lists/main_content_pages.dart';
import 'package:the_names_of/presentation/widgets/main_page_item_to.dart';
import 'package:the_names_of/presentation/widgets/main_page_text_title.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      body: ListView(
        children: [
          MainPageTextTitle(
            text: AppStrings.descriptionHead,
            textColor: appColors.contentColor,
          ),
          const MainContentPages(),
          MainPageItemTo(
            routeName: '',
            textColor: appColors.contentColor,
          ),
        ],
      ),
    );
  }
}
