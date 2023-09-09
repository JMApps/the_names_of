import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/data/local/database_quiz_query.dart';
import 'package:the_names_of/domain/models/quiz_model.dart';
import 'package:the_names_of/presentation/widgets/crib_Item.dart';

class CribPage extends StatelessWidget {
  const CribPage({super.key, required this.quizMode});

  final int quizMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.crib),
      ),
      body: FutureBuilder<List<QuizModel>>(
        future: quizMode == 1
            ? DatabaseQuizQuery().getArabicQuiz()
            : DatabaseQuizQuery().getRussianQuiz(),
        builder: (BuildContext context, AsyncSnapshot<List<QuizModel>> snapshot) {
          if (snapshot.hasData) {
            return CupertinoScrollbar(
              child: GridView.builder(
                padding: AppStyles.mainMardingMini,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final QuizModel model = snapshot.data![index];
                  return CribItem(model: model, index: index);
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
                    fontSize: 18,
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
      ),
    );
  }
}
