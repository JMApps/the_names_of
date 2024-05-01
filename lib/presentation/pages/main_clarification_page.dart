import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_names_of/application/strings/app_constraints.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/data/repositories/book_content_data_repository.dart';
import 'package:the_names_of/domain/entities/clarification_entity.dart';
import 'package:the_names_of/presentation/items/clarification_item.dart';
import 'package:the_names_of/presentation/widgets/main_smooth_indicator.dart';

class MainClarificationPage extends StatefulWidget {
  const MainClarificationPage({super.key, required this.clarificationIndex});

  final int clarificationIndex;

  @override
  State<MainClarificationPage> createState() => _MainClarificationPageState();
}

class _MainClarificationPageState extends State<MainClarificationPage> {
  final Box _contentSettingsBox = Hive.box(AppConstraints.keyAppSettingsBox);
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.clarificationIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.clarificationNames),
        backgroundColor: appColors.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'app_settings_page');
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<ClarificationModel>>(
        future: BookContentDataRepository().getAllClarifications(),
        builder: (BuildContext context, AsyncSnapshot<List<ClarificationModel>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(height: 8),
                MainSmoothIndicator(
                  controller: _pageController,
                  count: snapshot.data!.length,
                  dotColor: Colors.green,
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ClarificationModel model = snapshot.data![index];
                      return ClarificationItem(model: model);
                    },
                    onPageChanged: (int? pageIndex) {
                      _contentSettingsBox.put(AppConstraints.keyLastMainClarificationIndex, pageIndex!);
                    },
                  ),
                ),
                const SizedBox(height: 16),
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
      ),
    );
  }
}
