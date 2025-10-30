import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/routes/route_names.dart';
import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../names/lists/root_names_page_list.dart';
import '../state/content_clarification_state.dart';
import '../quiz/widgets/main_quiz_card.dart';
import '../widgets/main_screen_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          IconButton(
            onPressed: () {
              SharePlus.instance.share(
                ShareParams(
                  text: '${AppStrings.fullAppName}\n${AppStrings.iOSLink}',
                  sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 5),
                ),
              );
            },
            tooltip: AppStrings.share,
            icon: Icon(Icons.ios_share_rounded, color: appColors.primary),
          ),
        ],
      ),
      body: OrientationLayoutBuilder(
        portrait: (context) => _buildPortraitLayout(appColors),
        landscape: (context) => _buildLandscapeLayout(appColors),
      ),
    );
  }

  /// ---------- Portrait ----------
  Widget _buildPortraitLayout(ColorScheme appColors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(flex: 3, child: RootNamesPageList()),
        const SizedBox(height: 10),
        Expanded(child: _ContentClarificationSection()),
        Expanded(child: _NamesAndCardsSection()),
        _QuizTitle(appColors: appColors),
        const _QuizRow(),
      ],
    );
  }

  /// ---------- Landscape ----------
  Widget _buildLandscapeLayout(ColorScheme appColors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            children: const [
              Expanded(child: RootNamesPageList()),
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: _ContentClarificationSection()),
                    Expanded(child: _NamesAndCardsSection()),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        _QuizTitle(appColors: appColors),
        const _QuizRow(),
      ],
    );
  }
}

/// ---------- Subsections ----------

class _ContentClarificationSection extends StatelessWidget {
  const _ContentClarificationSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.mardingBottomOnly,
      child: Consumer<ContentClarificationState>(
        builder: (context, state, _) {
          return _MainRow(
            children: [
              MainScreenItem(
                routeName: RouteNames.mainContentsPage,
                title: AppStrings.heads,
                isIndicator: true,
                totalPages: 15,
                pageNumber: state.contentPage,
              ),
              MainScreenItem(
                routeName: RouteNames.mainClarificationsPage,
                title: AppStrings.clarification,
                isIndicator: true,
                totalPages: 64,
                pageNumber: state.clarificationPage,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _NamesAndCardsSection extends StatelessWidget {
  const _NamesAndCardsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.mardingBottomOnly,
      child: _MainRow(
        children: [
          MainScreenItem(
            routeName: RouteNames.mainNamesPage,
            title: AppStrings.names,
            isIndicator: false,
            totalPages: 1,
            pageNumber: 99,
          ),
          MainScreenItem(
            routeName: RouteNames.cardsNamePage,
            title: AppStrings.cards,
            isIndicator: false,
            totalPages: 1,
            pageNumber: 99,
          ),
        ],
      ),
    );
  }
}

class _QuizTitle extends StatelessWidget {
  final ColorScheme appColors;

  const _QuizTitle({
    required this.appColors,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appColors.primaryContainer,
      margin: AppStyles.mainMardingHorizontal,
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Text(
          AppStrings.quiz,
          style: AppStyles.mainTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _QuizRow extends StatelessWidget {
  const _QuizRow();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: AppStyles.mardingVertical,
      child: _MainRow(
        children: [
          MainQuizCard(
            quizTitle: AppStrings.arabicRussian,
            routeName: RouteNames.arRuQuizPage,
          ),
          MainQuizCard(
            quizTitle: AppStrings.russianArabic,
            routeName: RouteNames.ruArQuizPage,
          ),
        ],
      ),
    );
  }
}

/// ---------- Shared Row Layout ----------
class _MainRow extends StatelessWidget {
  final List<Widget> children;

  const _MainRow({
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        const SizedBox(),
        ...children.map((child) => Expanded(child: child)),
        const SizedBox(),
      ],
    );
  }
}
