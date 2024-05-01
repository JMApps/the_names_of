import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_names_of/domain/usecases/book_content_use_case.dart';
import 'package:the_names_of/presentation/widgets/error_data_text.dart';

import '../../application/strings/app_constraints.dart';
import '../../application/strings/app_strings.dart';
import '../../data/repositories/book_content_data_repository.dart';
import '../../domain/entities/clarification_entity.dart';
import '../items/clarification_item.dart';
import '../widgets/main_smooth_indicator.dart';

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
      body: FutureBuilder<List<ClarificationEntity>>(
        future: BookContentUseCase(BookContentDataRepository()).fetchAllClarifications(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
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
                      final ClarificationEntity clarificationModel = snapshot.data![index];
                      return ClarificationItem(clarificationModel: clarificationModel);
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
