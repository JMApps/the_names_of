import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_names_of/components/russian_option.dart';
import 'package:the_names_of/controllers/question_russian_controller.dart';
import 'package:the_names_of/model/question_russian.dart';

class RussianQuestionCard extends StatelessWidget {
  const RussianQuestionCard({Key? key, required this.question}) : super(key: key);

  final QuestionRussian question;

  @override
  Widget build(BuildContext context) {
    QuestionRussianController _questionRussianController =
        Get.put(QuestionRussianController());
    bool _onTapState = true;
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            elevation: 3,
            shadowColor: Colors.teal,
            margin: EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFF64B5F6),
                    Color(0xFFBBDEFB),
                  ],
                ),
              ),
              child: Text(
                question.question!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          ...List.generate(
            question.options!.length,
            (index) => RussianOption(
              index: index,
              text: question.options![index],
              press: () {
                if (!_questionRussianController.checkForLast()) {
                  if (_onTapState) {
                    _questionRussianController.checkAnswer(question, index);
                  }
                  _onTapState = false;
                } else {
                  _onTapState = false;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
