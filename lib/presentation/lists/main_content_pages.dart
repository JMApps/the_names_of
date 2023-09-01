import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/data/local/database_query.dart';
import 'package:the_names_of/domain/models/content_model.dart';
import 'package:the_names_of/presentation/items/main_content_item.dart';

class MainContentPages extends StatelessWidget {
  const MainContentPages({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ContentModel>>(
      future: DatabaseQuery().getAllContents(),
      builder: (BuildContext context, AsyncSnapshot<List<ContentModel>> snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 250,
            child: PageView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final ContentModel model = snapshot.data![index];
                return MainContentItem(model: model);
              },
            ),
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
