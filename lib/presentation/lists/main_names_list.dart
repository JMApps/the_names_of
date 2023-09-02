import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/data/local/database_query.dart';
import 'package:the_names_of/domain/models/name_model.dart';
import 'package:the_names_of/presentation/items/main_name_item.dart';
import 'package:the_names_of/presentation/widgets/main_smooth_indicator.dart';

class MainNamesList extends StatefulWidget {
  const MainNamesList({super.key});

  @override
  State<MainNamesList> createState() => _MainNamesListState();
}

class _MainNamesListState extends State<MainNamesList> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NameModel>>(
      future: DatabaseQuery().getAllNames(),
      builder: (BuildContext context, AsyncSnapshot<List<NameModel>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              SizedBox(
                height: 175,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final NameModel model = snapshot.data![index];
                    return MainNamesItem(model: model);
                  },
                ),
              ),
              MainSmoothIndicator(
                controller: _pageController,
                count: snapshot.data!.length,
                dotColor: Colors.red,
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
