import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_names_of/controllers/question_russian_controller.dart';

class ScoreRussianPage extends StatelessWidget {
  const ScoreRussianPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionRussianController _questionRussianController =
        Get.put(QuestionRussianController());
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFFFEBEE),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'РЕЗУЛЬТАТ РУ-АР',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 32),
            Text(
              'Я ответил правильно на:',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 16),
            Text(
              '${_questionRussianController.trueAnswerCount} из ${_questionRussianController.questions.length}',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 16),
            MaterialButton(
              color: Colors.orange,
              onPressed: () {
                _questionRussianController.shareResult();
              },
              child: Text(
                'Поделиться',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            _questionRussianController.checkForLast()
                ? MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      _questionRussianController.resetQuiz();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Начать сначала',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  )
                : SizedBox(),
            MaterialButton(
              color: Colors.red,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Закрыть',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
