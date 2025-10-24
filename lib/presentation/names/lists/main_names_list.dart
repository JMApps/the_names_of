import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/name_entity.dart';
import '../../state/main_content_state.dart';
import '../../state/main_names_state.dart';
import '../../widgets/error_data_text.dart';
import '../items/main_name_item.dart';

class MainNamesList extends StatelessWidget {
  const MainNamesList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NameEntity>>(
      future: Provider.of<MainContentState>(context, listen: false).getAllNames(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorDataText(textData: snapshot.error.toString());
        }
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return ScrollablePositionedList.builder(
            itemScrollController: Provider.of<MainNamesState>(context, listen: false).itemScrollController,
            padding: AppStyles.mainMardingMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final NameEntity nameModel = snapshot.data![index];
              return MainNameItem(nameModel: nameModel);
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
