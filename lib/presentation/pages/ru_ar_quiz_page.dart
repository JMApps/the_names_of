import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/application/state/quiz_ar_ru_state.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/quiz_model.dart';
import 'package:the_names_of/presentation/widgets/quiz_answer_item.dart';

class RuArQuizPage extends StatelessWidget {
  const RuArQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuizArRuState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.quiz),
        ),
        body: Consumer<QuizArRuState>(
          builder: (context, quizState, _) {
            return FutureBuilder<List<QuizModel>>(
              future: quizState.databaseQuizQuery.getArabicQuiz(),
              builder: (BuildContext context, AsyncSnapshot<List<QuizModel>> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 16),
                      Card(
                        child: Padding(
                          padding: AppStyles.mainMardingMini,
                          child: Text(
                            '${AppStrings.question} ${quizState.getArRuModePageNumber + 1}/99',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: PageView.builder(
                          controller: quizState.getPageController,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final QuizModel model = snapshot.data![index];
                            return Padding(
                              padding: AppStyles.mainMardingHorizontal,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Card(
                                    color: appColors.inversePrimary,
                                    child: Padding(
                                      padding: AppStyles.mainMarding,
                                      child: Text(
                                        model.question,
                                        style: const TextStyle(
                                          fontFamily: 'Khebrat',
                                          fontSize: 35,
                                        ),
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Expanded(
                                    child: ListView.builder(
                                      physics:
                                      const NeverScrollableScrollPhysics(),
                                      itemCount: model.answers.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return QuizAnswerItem(
                                          model: model,
                                          index: index,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          onPageChanged: (int? pageIndex) {
                            quizState.changePageIndex(pageIndex!);
                          },
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
