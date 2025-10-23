import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/name_entity.dart';
import '../../state/main_content_state.dart';
import '../../state/main_names_state.dart';
import '../../widgets/error_data_text.dart';
import '../items/main_name_page_item.dart';

class MainNamesPageList extends StatefulWidget {
  const MainNamesPageList({super.key});

  @override
  State<MainNamesPageList> createState() => _MainNamesPageListState();
}

class _MainNamesPageListState extends State<MainNamesPageList> {
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
          return Consumer<MainNamesState>(
            builder: (context, mainNamesState, _) {
              return Column(
                children: [
                  const SizedBox(height: 8),
                  Padding(
                    padding: AppStyles.mainMardingHorizontalMini,
                    child: LinearProgressIndicator(
                      minHeight: 6,
                      value: mainNamesState.namePage / 99,
                      year2023: false,
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: mainNamesState.pageController,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final NameEntity nameModel = snapshot.data![index];
                        return MainNamePageItem(nameModel: nameModel);
                      },
                      onPageChanged: (int page) {
                        mainNamesState.namePage = page;
                      },
                    ),
                  ),
                  Padding(
                    padding: AppStyles.mardingWithoutTop,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton.filled(
                          onPressed: () {
                            mainNamesState.pageController.previousPage(
                              duration: Duration(milliseconds: 350),
                              curve: Curves.easeInOut,
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: appColors.inversePrimary,
                          ),
                          iconSize: 35.0,
                        ),
                        Text(
                          '${mainNamesState.namePage + 1} из 99',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: AppStrings.fontGilroy,
                          ),
                        ),
                        IconButton.filled(
                          onPressed: () {
                            mainNamesState.pageController.nextPage(
                              duration: Duration(milliseconds: 350),
                              curve: Curves.easeInOut,
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: appColors.inversePrimary,
                          ),
                          iconSize: 35.0,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
