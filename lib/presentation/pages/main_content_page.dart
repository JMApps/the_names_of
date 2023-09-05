import 'package:flutter/material.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/presentation/lists/content_pages.dart';

class MainContentPage extends StatelessWidget {
  const MainContentPage({super.key, required this.contentId});

  final int? contentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.descriptionHeads),
      ),
      body: ContentPages(contentId: contentId),
    );
  }
}
