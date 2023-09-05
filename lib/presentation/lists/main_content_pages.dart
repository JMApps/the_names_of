import 'package:flutter/material.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/data/local/database_query.dart';
import 'package:the_names_of/domain/models/content_model.dart';
import 'package:the_names_of/presentation/items/main_content_item.dart';
import 'package:the_names_of/presentation/widgets/main_smooth_indicator.dart';

class MainContentPages extends StatefulWidget {
  const MainContentPages({super.key});

  @override
  State<MainContentPages> createState() => _MainContentPagesState();
}

class _MainContentPagesState extends State<MainContentPages> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ContentModel>>(
      future: DatabaseQuery().getAllContents(),
      builder: (BuildContext context, AsyncSnapshot<List<ContentModel>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              SizedBox(
                height: 250,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ContentModel model = snapshot.data![index];
                    return MainContentItem(model: model, contentIndex: index);
                  },
                ),
              ),
              MainSmoothIndicator(
                controller: _pageController,
                count: snapshot.data!.length,
                dotColor: Colors.orange,
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
