import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_names_of/components/quiz_body.dart';
import 'package:the_names_of/controllers/question_controller.dart';
import 'package:the_names_of/score/score_page.dart';

class QuizQuestionPage extends StatefulWidget {
  const QuizQuestionPage({Key? key}) : super(key: key);

  @override
  _QuizQuestionPageState createState() => _QuizQuestionPageState();
}

class _QuizQuestionPageState extends State<QuizQuestionPage> {
  QuestionController _questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
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
              Get.to(ScorePage());
            },
            icon: Icon(CupertinoIcons.arrow_clockwise),
          ),
        ],
      ),
      body: QuizBody(),
    );
  }
}
