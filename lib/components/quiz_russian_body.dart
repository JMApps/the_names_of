import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_names_of/components/russian_question_card.dart';
import 'package:the_names_of/controllers/question_russian_controller.dart';

class QuizRussianBody extends StatelessWidget {
  const QuizRussianBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionRussianController _questionRussianController =
        Get.put(QuestionRussianController());
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFFE0F7FA),
            Color(0xFFFFFFFF),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(8),
            child: Obx(
              () => Text.rich(
                TextSpan(
                  text:
                      'Вопрос ${_questionRussianController.questionRussianNumber.value}',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  children: [
                    TextSpan(
                      text:
                          '/${_questionRussianController.russianQuestions.length}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[300]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: PageView.builder(
              //physics: NeverScrollableScrollPhysics(),
              controller: _questionRussianController.pageController,
              itemCount: _questionRussianController.russianQuestions.length,
              onPageChanged: _questionRussianController.updateQuestionNumber,
              itemBuilder: (context, index) => RussianQuestionCard(
                question: _questionRussianController.russianQuestions[index],
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
