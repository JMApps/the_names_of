import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_names_of/arguments/quiz_arguments.dart';
import 'package:the_names_of/components/quiz_arabic_body.dart';
import 'package:the_names_of/components/quiz_russian_body.dart';
import 'package:the_names_of/score/score_arabic_page.dart';
import 'package:the_names_of/score/score_russian_page.dart';

class QuizQuestionPage extends StatefulWidget {
  const QuizQuestionPage({Key? key}) : super(key: key);

  @override
  _QuizQuestionPageState createState() => _QuizQuestionPageState();
}

class _QuizQuestionPageState extends State<QuizQuestionPage> {
  late QuizArguments? args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as QuizArguments?;
    return Scaffold(
      appBar: AppBar(
        title: Text('Викторина'),
        backgroundColor: Colors.teal,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF00796B),
                Color(0xFF4DB6AC),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(args!.id! == 0 ? ScoreArabicPage() : ScoreRussianPage());
            },
            icon: Icon(CupertinoIcons.info),
          ),
        ],
      ),
      body: args!.id! == 0 ? QuizArabicBody() : QuizRussianBody(),
    );
  }
}
