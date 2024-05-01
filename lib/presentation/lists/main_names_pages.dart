import 'dart:math';

import 'package:flutter/material.dart';

import '../../data/repositories/book_content_data_repository.dart';
import '../../domain/entities/name_entity.dart';
import '../../domain/usecases/book_content_use_case.dart';
import '../items/main_name_page_item.dart';
import '../widgets/error_data_text.dart';
import '../widgets/main_smooth_indicator.dart';

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
    _pageController = PageController(initialPage: _random.nextInt(99));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NameEntity>>(
      future: BookContentUseCase(BookContentDataRepository()).fetchAllNames(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Column(
            children: [
              SizedBox(
                height: 150,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final NameEntity nameModel = snapshot.data![index];
                    return MainNamesPageItem(
                      nameModel: nameModel,
                      index: index,
                    );
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
