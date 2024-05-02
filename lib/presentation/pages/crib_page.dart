import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../application/strings/app_strings.dart';
import '../../application/styles/app_styles.dart';
import '../../data/repositories/quiz_data_repository.dart';
import '../../domain/entities/quiz_entity.dart';
import '../../domain/usecases/quiz_use_case.dart';
import '../items/crib_Item.dart';
import '../widgets/error_data_text.dart';

class CribPage extends StatelessWidget {
  const CribPage({
    super.key,
    required this.quizMode,
  });

  final int quizMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.crib),
      ),
      body: FutureBuilder<List<QuizEntity>>(
        future: quizMode == 1
            ? QuizUseCase(QuizDataRepository()).fetchArabicQuiz()
            : QuizUseCase(QuizDataRepository()).fetchRussianQuiz(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
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
                  final QuizEntity quizModel = snapshot.data![index];
                  return CribItem(
                    quizModel: quizModel,
                    index: index,
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return ErrorDataText(textData: snapshot.error.toString());
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
