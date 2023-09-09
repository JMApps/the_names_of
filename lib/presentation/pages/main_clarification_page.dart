import 'package:flutter/material.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/data/local/database_query.dart';
import 'package:the_names_of/domain/models/clarification_model.dart';
import 'package:the_names_of/presentation/items/clarification_item.dart';
import 'package:the_names_of/presentation/widgets/main_smooth_indicator.dart';

class MainClarificationPage extends StatefulWidget {
  const MainClarificationPage({super.key, required this.clarificationIndex});

  final int clarificationIndex;

  @override
  State<MainClarificationPage> createState() => _MainClarificationPageState();
}

class _MainClarificationPageState extends State<MainClarificationPage> {
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
        future: DatabaseQuery().getAllClarifications(),
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
