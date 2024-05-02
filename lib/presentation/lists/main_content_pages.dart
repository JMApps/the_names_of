import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../application/strings/app_constraints.dart';
import '../../data/repositories/book_content_data_repository.dart';
import '../../domain/entities/content_entity.dart';
import '../../domain/usecases/book_content_use_case.dart';
import '../items/main_content_item.dart';
import '../widgets/error_data_text.dart';
import '../widgets/main_smooth_indicator.dart';

class MainContentPages extends StatefulWidget {
  const MainContentPages({super.key});

  @override
  State<MainContentPages> createState() => _MainContentPagesState();
}

class _MainContentPagesState extends State<MainContentPages> {
  late final PageController _pageController;
  final Box _contentSettingsBox = Hive.box(AppConstraints.keyAppSettingsBox);
  late int _initialPageIndex;

  @override
  void initState() {
    _initialPageIndex = _contentSettingsBox.get(AppConstraints.keyLastMainContentIndex, defaultValue: 0);
    _pageController = PageController(initialPage: _initialPageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ContentEntity>>(
      future: BookContentUseCase(BookContentDataRepository()).fetchAllContents(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Column(
            children: [
              SizedBox(
                height: 250,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ContentEntity contentEntity = snapshot.data![index];
                    return MainContentItem(
                      contentEntity: contentEntity,
                      contentIndex: index,
                    );
                  },
                ),
              ),
              MainSmoothIndicator(
                controller: _pageController,
                count: snapshot.data!.length,
                dotColor: Colors.orange,
              ),
              const SizedBox(height: 8),
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
    );
  }
}
