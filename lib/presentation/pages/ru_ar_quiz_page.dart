import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/application/state/quiz_ru_ar_state.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/arguments/quiz_mode_args.dart';
import 'package:the_names_of/domain/models/quiz_model.dart';
import 'package:the_names_of/presentation/items/ru_ar_quiz_item.dart';

class RuArQuizPage extends StatelessWidget {
  const RuArQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuizRuArState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.quiz),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  'quiz_score_page',
                  arguments: QuizModeArgs(quizMode: 2),
                );
              },
              icon: Icon(
                Icons.info_outline,
                color: appColors.primary,
              ),
            ),
          ],
        ),
        body: Consumer<QuizRuArState>(
          builder: (context, quizState, _) {
            return FutureBuilder<List<QuizModel>>(
              future: quizState.databaseQuizQuery.getRussianQuiz(),
              builder: (BuildContext context, AsyncSnapshot<List<QuizModel>> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 4),
                      Card(
                        margin: AppStyles.mainMardingMini,
                        child: Padding(
                          padding: AppStyles.mainMardingMini,
                          child: Text(
                            '${AppStrings.question} ${quizState.getRuArModePageNumber}/99',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Expanded(
                        child: PageView.builder(
                          controller: quizState.getPageController,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final QuizModel model = snapshot.data![index];
                            return RuArQuizItem(model: model, index: index);
                          },
                          onPageChanged: (int? pageIndex) {
                            quizState.changePageIndex(pageIndex!);
                          },
                        ),
                      ),
                      Visibility(
                        visible: quizState.getRuArModePageNumber == 99,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 16,
                            bottom: 16,
                            left: 16,
                          ),
                          child: OutlinedButton(
                            onPressed: () {
                              quizState.resetQuiz();
                            },
                            child: const Text(
                              AppStrings.reset,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Padding(
                      padding: AppStyles.mainMarding,
                      child: Text(
                        snapshot.error.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: appColors.error,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
