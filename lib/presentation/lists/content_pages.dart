import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/application/state/main_contents_state.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/data/local/database_query.dart';
import 'package:the_names_of/domain/models/content_model.dart';
import 'package:the_names_of/presentation/items/content_item.dart';
import 'package:the_names_of/presentation/widgets/main_smooth_indicator.dart';

class ContentPages extends StatelessWidget {
  const ContentPages({super.key, required this.contentId});

  final int? contentId;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainContentsState(contentId ?? 0),
        ),
      ],
      child: Consumer<MainContentsState>(
        builder: (context, state, _) {
          return FutureBuilder<List<ContentModel>>(
            future: DatabaseQuery().getAllContents(),
            builder: (BuildContext context,
                AsyncSnapshot<List<ContentModel>> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    const SizedBox(height: 8),
                    MainSmoothIndicator(
                      controller: state.getPageController,
                      count: snapshot.data!.length,
                      dotColor: Colors.orange,
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: PageView.builder(
                        controller: state.getPageController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final ContentModel model = snapshot.data![index];
                          return ContentItem(model: model);
                        },
                      ),
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
        },
      ),
    );
  }
}
