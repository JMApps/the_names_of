import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_names_of/controllers/question_arabic_controller.dart';

class ScoreArabicPage extends StatelessWidget {
  const ScoreArabicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionArabicController _questionArabicController =
        Get.put(QuestionArabicController());
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
              'РЕЗУЛЬТАТ: АРБСКО-РУССКИЙ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            Text(
              'Я ответил правильно на:',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${_questionArabicController.trueAnswerCount} из ${_questionArabicController.questions.length}',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.info_circle_fill,
                    size: 30,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/arabic_answer_result');
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            MaterialButton(
              color: Colors.orange,
              onPressed: () {
                _questionArabicController.shareResult();
              },
              child: Text(
                'Поделиться',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                _questionArabicController.resetQuiz();
                Navigator.pop(context);
              },
              child: Text(
                'Начать сначала',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            // _questionArabicController.checkForLast()
            //     ?
            //     : SizedBox(),
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
