import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/routes/route_names.dart';
import '../../application/state/quiz_ru_ar_state.dart';
import '../../application/strings/app_strings.dart';
import '../../application/styles/app_styles.dart';
import '../../data/models/arguments/quiz_mode_args.dart';
import '../../domain/entities/quiz_entity.dart';
import '../items/ru_ar_quiz_item.dart';
import '../widgets/error_data_text.dart';

class RuArQuizPage extends StatelessWidget {
  const RuArQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
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
                  RouteNames.quizScorePage,
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
            return FutureBuilder<List<QuizEntity>>(
              future: quizState.getQuizUseCase.fetchRussianQuiz(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
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
                            final QuizEntity model = snapshot.data![index];
                            return RuArQuizItem(
                              model: model,
                              index: index,
                            );
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
                  return ErrorDataText(textData: snapshot.error.toString());
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
