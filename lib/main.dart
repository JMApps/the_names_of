import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'application/state/content_settings_state.dart';
import 'application/state/main_data_state.dart';
import 'application/state/main_names_state.dart';
import 'application/strings/app_constraints.dart';
import 'presentation/pages/root_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(AppConstraints.keyAppSettingsBox);
  await Hive.openBox(AppConstraints.keyQuizApp);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainDataState(),
        ),
        ChangeNotifierProvider(
          create: (_) => ContentSettingsState(),
        ),
        ChangeNotifierProvider(
          create: (_) => MainNamesState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
