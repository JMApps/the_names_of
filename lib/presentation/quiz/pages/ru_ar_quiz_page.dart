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
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: AppStyles.mainMardingHorizontal,
                      child: LinearProgressIndicator(
                        minHeight: 6,
                        borderRadius: AppStyles.mainBorder,
                        value: quizState.ruArModePageNumber / 99,
                        year2023: false,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Card(
                      margin: AppStyles.mainMardingMini,
                      elevation: 0,
                      color: appColors.secondary.withAlpha(35),
                      child: Padding(
                        padding: AppStyles.mainMardingMini,
                        child: Text(
                          '${AppStrings.question} ${quizState.ruArModePageNumber}/99',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: AppStrings.fontGilroy,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: quizState.pageController,
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
