import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../application/state/main_data_state.dart';
import '../../application/strings/app_constraints.dart';
import '../../domain/entities/clarification_entity.dart';
import '../items/main_clarification_item.dart';
import '../widgets/error_data_text.dart';
import '../widgets/main_smooth_indicator.dart';

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
    return FutureBuilder<List<ClarificationEntity>>(
      future: Provider.of<MainDataState>(context, listen: false).getBookContentUseCase.fetchAllClarifications(),
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
                    final ClarificationEntity clarificationModel = snapshot.data![index];
                    return MainClarificationItem(
                      clarificationModel: clarificationModel,
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
