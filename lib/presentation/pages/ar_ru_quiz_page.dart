import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_names_of/application/state/quiz_ar_ru_state.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/styles/app_styles.dart';
import 'package:the_names_of/domain/models/arguments/quiz_mode_args.dart';
import 'package:the_names_of/domain/models/quiz_model.dart';
import 'package:the_names_of/presentation/widgets/ar_ru_quiz_item.dart';

class ArRuQuizPage extends StatelessWidget {
  const ArRuQuizPage({super.key});

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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  'quiz_score_page',
                  arguments: QuizModeArgs(quizMode: 1),
                );
              },
              icon: Icon(
                Icons.info,
                color: appColors.primary,
              ),
            ),
          ],
        ),
        body: Consumer<QuizArRuState>(
          builder: (context, quizState, _) {
            return FutureBuilder<List<QuizModel>>(
              future: quizState.databaseQuizQuery.getArabicQuiz(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<QuizModel>> snapshot) {
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
                            '${AppStrings.question} ${quizState.getArRuModePageNumber}/99',
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
                            return ArRuQuizItem(model: model, index: index);
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
