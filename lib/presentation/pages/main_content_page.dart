import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_names_of/application/routes/route_names.dart';

import '../../application/strings/app_constraints.dart';
import '../../application/strings/app_strings.dart';
import '../../data/repositories/book_content_data_repository.dart';
import '../../domain/entities/content_entity.dart';
import '../../domain/usecases/book_content_use_case.dart';
import '../items/content_item.dart';
import '../widgets/error_data_text.dart';
import '../widgets/main_smooth_indicator.dart';

class MainContentPage extends StatefulWidget {
  const MainContentPage({super.key, required this.contentIndex});

  final int contentIndex;

  @override
  State<MainContentPage> createState() => _MainContentPageState();
}

class _MainContentPageState extends State<MainContentPage> {
  final Box _contentSettingsBox = Hive.box(AppConstraints.keyAppSettingsBox);
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.contentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.descriptionHeads),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.appSettingsPage);
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<ContentEntity>>(
        future: BookContentUseCase(BookContentDataRepository()).fetchAllContents(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Column(
              children: [
                const SizedBox(height: 8),
                MainSmoothIndicator(
                  controller: _pageController,
                  count: snapshot.data!.length,
                  dotColor: Colors.orange,
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ContentEntity contentModel = snapshot.data![index];
                      return ContentItem(contentModel: contentModel);
                    },
                    onPageChanged: (int? pageIndex) {
                      _contentSettingsBox.put(AppConstraints.keyLastMainContentIndex, pageIndex!);
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            );
          } else if (snapshot.hasError) {
            return ErrorDataText(textData: snapshot.error.toString());
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
