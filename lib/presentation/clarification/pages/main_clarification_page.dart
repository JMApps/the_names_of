import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/strings/app_constraints.dart';
import '../../../core/strings/app_strings.dart';
import '../../../domain/entities/clarification_entity.dart';
import '../items/clarification_item.dart';
import '../../state/main_content_state.dart';
import '../../widgets/error_data_text.dart';
import '../../widgets/main_smooth_indicator.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.clarificationNames),
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
      body: FutureBuilder<List<ClarificationEntity>>(
        future: Provider.of<MainContentState>(context, listen: false).getAllClarifications(),
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
