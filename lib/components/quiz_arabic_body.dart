import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_names_of/components/arabic_question_card.dart';
import 'package:the_names_of/controllers/question_arabic_controller.dart';

class QuizArabicBody extends StatelessWidget {
  const QuizArabicBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionArabicController _questionArabicController =
        Get.put(QuestionArabicController());
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
                      'Вопрос ${_questionArabicController.questionNumber.value}',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  children: [
                    TextSpan(
                      text: '/${_questionArabicController.questions.length}',
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
              physics: NeverScrollableScrollPhysics(),
              controller: _questionArabicController.pageController,
              itemCount: _questionArabicController.questions.length,
              onPageChanged: _questionArabicController.updateQuestionNumber,
              itemBuilder: (context, index) => ArabicQuestionCard(
                question: _questionArabicController.questions[index],
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
