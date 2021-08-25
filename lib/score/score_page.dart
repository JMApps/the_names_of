import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_names_of/controllers/question_controller.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Scaffold(
      body: Column(
        children: [
          Spacer(flex: 3),
          Text(
            'Score',
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.grey),
          ),
          Spacer(),
          Text(
            '${_questionController.correctAnswer * 10}/${_questionController.questions.length * 10}',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.grey),
          ),
          Spacer(flex: 3),
        ],
      ),
    );
  }
}
