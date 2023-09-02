import 'package:flutter/material.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/presentation/lists/main_clarification_pages.dart';
import 'package:the_names_of/presentation/lists/main_content_pages.dart';
import 'package:the_names_of/presentation/lists/main_names_list.dart';
import 'package:the_names_of/presentation/widgets/main_page_item_to.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      body: ListView(
        children: const [
          SizedBox(height: 16),
          MainPageItemTo(
            routeName: '',
            title: AppStrings.descriptionHeads,
          ),
          MainContentPages(),
          MainPageItemTo(
            routeName: '',
            title: AppStrings.names,
          ),
          MainNamesList(),
          MainPageItemTo(
            routeName: '',
            title: AppStrings.clarificationNames,
          ),
          MainClarificationPage(),
        ],
      ),
    );
  }
}
