import 'package:flutter/material.dart';
import 'package:the_names_of/pages/root_page.dart';
import 'package:the_names_of/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: _appRouter.onGenerateRoute,
      title: 'Имена Аллаха',
      theme: ThemeData(
        fontFamily: 'Gilroy',
        primarySwatch: Colors.blue,
      ),
      home: RootPage(),
    );
  }
}
