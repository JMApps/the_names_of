import 'package:flutter/material.dart';
import 'package:the_names_of/application/strings/app_strings.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      body: Container(),
    );
  }
}
