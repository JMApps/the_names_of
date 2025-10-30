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
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: AppStyles.mainMardingHorizontal,
                      child: LinearProgressIndicator(
                        minHeight: 6,
                        borderRadius: AppStyles.mainBorder,
                        value: quizState.arRuModePageNumber / 99,
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
                          '${AppStrings.question} ${quizState.arRuModePageNumber}/99',
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
