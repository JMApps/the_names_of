import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/name_entity.dart';
import '../../items/main_name_page_item.dart';
import '../../state/main_content_state.dart';
import '../../widgets/error_data_text.dart';
import '../../widgets/main_smooth_indicator.dart';

class NamesMainPage extends StatefulWidget {
  const NamesMainPage({super.key});

  @override
  State<NamesMainPage> createState() => _NamesMainPageState();
}

class _NamesMainPageState extends State<NamesMainPage> {
  final Random _random = Random();
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _random.nextInt(99));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return FutureBuilder<List<NameEntity>>(
      future: Provider.of<MainContentState>(context, listen: false).getAllNames(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorDataText(textData: snapshot.error.toString());
        }
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
                dotColor: appColors.tertiary,
              ),
              const SizedBox(height: 8),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
