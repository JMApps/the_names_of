import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_names_of/application/strings/app_constraints.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/data/local/database_query.dart';
import 'package:the_names_of/domain/models/content_model.dart';
import 'package:the_names_of/presentation/items/content_item.dart';
import 'package:the_names_of/presentation/widgets/main_smooth_indicator.dart';

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
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.descriptionHeads),
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
      body: FutureBuilder<List<ContentModel>>(
        future: DatabaseQuery().getAllContents(),
        builder: (BuildContext context, AsyncSnapshot<List<ContentModel>> snapshot) {
          if (snapshot.hasData) {
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
                      final ContentModel model = snapshot.data![index];
                      return ContentItem(model: model);
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
