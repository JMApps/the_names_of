import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_names_of/application/strings/app_constraints.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/data/repositories/book_content_data_repository.dart';
import 'package:the_names_of/domain/entities/clarification_entity.dart';
import 'package:the_names_of/presentation/items/main_clarification_item.dart';
import 'package:the_names_of/presentation/widgets/main_smooth_indicator.dart';

class MainClarificationPages extends StatefulWidget {
  const MainClarificationPages({super.key});

  @override
  State<MainClarificationPages> createState() => _MainClarificationPagesState();
}

class _MainClarificationPagesState extends State<MainClarificationPages> {
  late final PageController _pageController;
  final Box _contentSettingsBox = Hive.box(AppConstraints.keyAppSettingsBox);
  int _initialPageIndex = 0;

  @override
  void initState() {
    _initialPageIndex = _contentSettingsBox.get(AppConstraints.keyLastMainClarificationIndex, defaultValue: 0);
    _pageController = PageController(initialPage: _initialPageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return FutureBuilder<List<ClarificationModel>>(
      future: BookContentDataRepository().getAllClarifications(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              SizedBox(
                height: 250,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ClarificationModel model = snapshot.data![index];
                    return MainClarificationItem(
                      model: model,
                      clarificationIndex: index,
                    );
                  },
                ),
              ),
              MainSmoothIndicator(
                controller: _pageController,
                count: snapshot.data!.length,
                dotColor: Colors.green,
              ),
              const SizedBox(height: 8),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: AppStyles.mainMarding,
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(
                  color: appColors.error,
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
