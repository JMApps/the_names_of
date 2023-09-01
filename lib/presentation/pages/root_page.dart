import 'package:flutter/material.dart';
import 'package:the_names_of/application/strings/app_strings.dart';
import 'package:the_names_of/application/themes/app_theme.dart';
import 'package:the_names_of/presentation/pages/main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const MainPage(),
    );
  }
}
