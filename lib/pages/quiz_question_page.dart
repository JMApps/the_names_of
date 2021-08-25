import 'package:flutter/material.dart';
import 'package:the_names_of/components/quiz_body.dart';

class QuizQuestionPage extends StatefulWidget {
  const QuizQuestionPage({Key? key}) : super(key: key);

  @override
  _QuizQuestionPageState createState() => _QuizQuestionPageState();
}

class _QuizQuestionPageState extends State<QuizQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вопросы'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: QuizBody(),
    );
  }
}
