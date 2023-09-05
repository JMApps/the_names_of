import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/application/state/main_contents_state.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/presentation/lists/content_pages.dart';

class MainContentPage extends StatelessWidget {
  const MainContentPage({super.key, required this.contentIndex});

  final int contentIndex;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainContentsState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.descriptionHeads),
        ),
        body: ContentPages(contentIndex: contentIndex),
      ),
    );
  }
}
