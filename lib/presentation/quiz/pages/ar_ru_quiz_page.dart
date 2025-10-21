import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/quiz_entity.dart';
import '../../state/quiz_ar_ru_state.dart';
import '../../widgets/error_data_text.dart';
import '../items/ar_ru_quiz_item.dart';

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
            tooltip: AppStrings.information,
            icon: Icon(
              Icons.info_outline_rounded,
              color: appColors.primary,
            ),
          ),
        ],
      ),
      body: Consumer<QuizArRuState>(
        builder: (context, quizState, _) {
          return FutureBuilder<List<QuizEntity>>(
            future: quizState.fetchAllArRuQuiz(),
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
                          '${AppStrings.question} ${quizState.arRuModePageNumber}/99',
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
                        physics: const NeverScrollableScrollPhysics(),
                        controller: quizState.pageController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final QuizEntity model = snapshot.data![index];
                          return ArRuQuizItem(
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
                      visible: quizState.arRuModePageNumber == 99,
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
