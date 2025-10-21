import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/quiz_entity.dart';
import '../../state/quiz_ru_ar_state.dart';
import '../../widgets/error_data_text.dart';
import '../items/ru_ar_quiz_item.dart';

class RuArQuizPage extends StatelessWidget {
  const RuArQuizPage({super.key});

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
                arguments: 2,
              );
            },
            tooltip: AppStrings.information,
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
            future: quizState.fetchAllRuArQuiz(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return ErrorDataText(textData: snapshot.error.toString());
              }
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      margin: AppStyles.mainMardingMini,
                      elevation: 0,
                      color: appColors.inversePrimary.withAlpha(75),
                      child: Padding(
                        padding: AppStyles.mainMardingMini,
                        child: Text(
                          '${AppStrings.question} ${quizState.getRuArModePageNumber}/99',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: AppStrings.fontGilroy,
                          ),
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
                        onPageChanged: (int page) {
                          quizState.changePageIndex(page);
                        },
                      ),
                    ),
                    Visibility(
                      visible: quizState.getRuArModePageNumber == 99,
                      child: Padding(
                        padding: AppStyles.mainMarding,
                        child: MaterialButton(
                          onPressed: () {
                            quizState.resetQuiz();
                          },
                          padding: AppStyles.mainMarding,
                          color: appColors.primary,
                          shape: AppStyles.mainShape,
                          elevation: 0,
                          child: Text(
                            AppStrings.resetQuiz,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: appColors.surface,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
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
