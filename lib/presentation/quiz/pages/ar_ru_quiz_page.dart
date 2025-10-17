import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/quiz_entity.dart';
import '../items/ar_ru_quiz_item.dart';
import '../../state/quiz_ar_ru_state.dart';
import '../../widgets/error_data_text.dart';

class ArRuQuizPage extends StatelessWidget {
  const ArRuQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.quiz),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                RouteNames.quizScorePage,
                arguments: 1,
              );
            },
            icon: Icon(
              Icons.info_outline,
              color: appColors.primary,
            ),
          ),
        ],
      ),
      body: Consumer<QuizArRuState>(
        builder: (context, quizState, _) {
          return FutureBuilder<List<QuizEntity>>(
            future: quizState.getQuizUseCase.fetchArabicQuiz(),
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
                          '${AppStrings.question} ${quizState.getArRuModePageNumber}/99',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: quizState.getPageController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final QuizEntity model = snapshot.data![index];
                          return ArRuQuizItem(
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
                      visible: quizState.getArRuModePageNumber == 99,
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
    );
  }
}
