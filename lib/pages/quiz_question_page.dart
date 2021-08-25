import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_names_of/components/quiz_body.dart';
import 'package:the_names_of/controllers/question_controller.dart';

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
        title: Text('Вопросы'),
        backgroundColor: Colors.teal,
        elevation: 0,
        actions: [
          _questionController.checkForReplay()
              ? IconButton(
                  onPressed: () {
                    _questionController.resetQuiz();
                  },
                  icon: Icon(
                    CupertinoIcons.arrow_clockwise,
                  ),
                )
              : SizedBox(),
        ],
      ),
      body: QuizBody(),
    );
  }
}
