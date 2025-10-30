import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/name_entity.dart';
import '../../state/main_content_state.dart';
import '../../widgets/error_data_text.dart';
import '../items/clarification_name_item.dart';

class ClarificationNamesList extends StatefulWidget {
  const ClarificationNamesList({
    super.key,
    required this.clarificationId,
  });

  final int clarificationId;

  @override
  State<ClarificationNamesList> createState() => _ClarificationNamesListState();
}

class _ClarificationNamesListState extends State<ClarificationNamesList> {
  late final Future<List<NameEntity>> _futureNames;

  @override
  void initState() {
    super.initState();
    _futureNames = Provider.of<MainContentState>(context, listen: false).getChapterNames(chapterId: widget.clarificationId);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NameEntity>>(
      future: _futureNames,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorDataText(textData: snapshot.error.toString());
        }
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Visibility(
                visible: snapshot.data!.isNotEmpty,
                child: Padding(
                  padding: AppStyles.mardingHorBottomMini,
                  child: Text(
                    snapshot.data!.length > 1 ? AppStrings.names : AppStrings.name,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: AppStyles.mainMardingHorizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final NameEntity nameModel = snapshot.data![index];
                  return ClarificationNameItem(nameModel: nameModel);
                },
              ),
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
