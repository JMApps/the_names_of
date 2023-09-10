import 'dart:math';

import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/data/local/database_query.dart';
import 'package:the_names_of/domain/models/name_model.dart';
import 'package:the_names_of/presentation/items/main_name_page_item.dart';
import 'package:the_names_of/presentation/widgets/main_smooth_indicator.dart';

class MainNamesPages extends StatefulWidget {
  const MainNamesPages({super.key});

  @override
  State<MainNamesPages> createState() => _MainNamesPagesState();
}

class _MainNamesPagesState extends State<MainNamesPages> {
  final Random _random = Random();
  late final PageController _pageController;

  @override
  void initState() {
    _pageController  = PageController(initialPage: _random.nextInt(99));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return FutureBuilder<List<NameModel>>(
      future: DatabaseQuery().getAllNames(),
      builder: (BuildContext context, AsyncSnapshot<List<NameModel>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              SizedBox(
                height: 150,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final NameModel model = snapshot.data![index];
                    return MainNamesPageItem(model: model, index: index);
                  },
                ),
              ),
              MainSmoothIndicator(
                controller: _pageController,
                count: snapshot.data!.length,
                dotColor: Colors.red,
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
