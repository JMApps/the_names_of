import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_names_of/components/arabic_question_card.dart';
import 'package:the_names_of/controllers/question_arabic_controller.dart';

class QuizArabicBody extends StatefulWidget {
  const QuizArabicBody({Key? key}) : super(key: key);

  @override
  _QuizArabicBodyState createState() => _QuizArabicBodyState();
}

class _QuizArabicBodyState extends State<QuizArabicBody> {
  late QuestionArabicController _questionArabicController;

  @override
  void initState() {
    _questionArabicController = Get.put(QuestionArabicController());
    _questionArabicController.jumpToPageState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      'Вопрос ${_questionArabicController.questionArabicNumber.value}',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  children: [
                    TextSpan(
                      text:
                          '/${_questionArabicController.arabicQuestions.length}',
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
              controller: _questionArabicController.arabicPageController,
              itemCount: _questionArabicController.arabicQuestions.length,
              onPageChanged: _questionArabicController.updateQuestionNumber,
              itemBuilder: (context, index) => ArabicQuestionCard(
                question: _questionArabicController.arabicQuestions[index],
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
