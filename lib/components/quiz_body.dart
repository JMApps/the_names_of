import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_names_of/components/question_card.dart';
import 'package:the_names_of/controllers/question_controller.dart';

class QuizBody extends StatelessWidget {
  const QuizBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Obx(
              () => Text.rich(
                TextSpan(
                  text: 'Вопрос ${_questionController.questionNumber.value}',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.teal),
                  children: [
                    TextSpan(
                      text: '/${_questionController.questions.length}',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(thickness: 1, color: Colors.teal, indent: 16, endIndent: 16),
          Expanded(
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _questionController.pageController,
              itemCount: _questionController.questions.length,
              onPageChanged: _questionController.updateQuestionNumber,
              itemBuilder: (context, index) => QuestionCard(
                question: _questionController.questions[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
