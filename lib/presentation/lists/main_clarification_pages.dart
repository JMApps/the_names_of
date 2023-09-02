import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/data/local/database_query.dart';
import 'package:the_names_of/domain/models/clarification_model.dart';
import 'package:the_names_of/presentation/items/main_clarification_item.dart';
import 'package:the_names_of/presentation/widgets/main_smooth_indicator.dart';

class MainClarificationPage extends StatefulWidget {
  const MainClarificationPage({super.key});

  @override
  State<MainClarificationPage> createState() => _MainClarificationPageState();
}

class _MainClarificationPageState extends State<MainClarificationPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ClarificationModel>>(
      future: DatabaseQuery().getAllClarifications(),
      builder: (BuildContext context, AsyncSnapshot<List<ClarificationModel>> snapshot) {
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
                    return MainClarificationItem(model: model);
                  },
                ),
              ),
              MainSmoothIndicator(
                controller: _pageController,
                count: snapshot.data!.length,
                dotColor: Colors.green,
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
                style: const TextStyle(
                  color: Colors.red,
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
