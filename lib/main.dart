import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'core/strings/app_constraints.dart';
import 'data/repositories/book_content_data_repository.dart';
import 'data/repositories/quiz_data_repository.dart';
import 'data/services/book_content_service.dart';
import 'data/services/quiz_service.dart';
import 'domain/usecases/book_content_use_case.dart';
import 'domain/usecases/quiz_use_case.dart';
import 'presentation/pages/root_page.dart';
import 'presentation/state/content_clarification_state.dart';
import 'presentation/state/content_settings_state.dart';
import 'presentation/state/main_content_state.dart';
import 'presentation/state/quiz_ar_ru_state.dart';
import 'presentation/state/quiz_ru_ar_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(AppConstraints.keyAppSettingsBox);
  await Hive.openBox(AppConstraints.keyQuizApp);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContentSettingsState(),
        ),
        ChangeNotifierProvider(
          create: (_) => ContentClarificationState(),
        ),
        ChangeNotifierProvider(
          create: (_) => MainContentState(
            BookContentUseCase(
              BookContentDataRepository(
                BookContentService(),
              ),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => QuizArRuState(
            QuizUseCase(
              QuizDataRepository(
                QuizService(),
              ),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => QuizRuArState(
            QuizUseCase(
              QuizDataRepository(
                QuizService(),
              ),
            ),
          ),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
