import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_names_of/components/option.dart';
import 'package:the_names_of/controllers/question_controller.dart';
import 'package:the_names_of/model/question.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.question}) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
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
              padding: EdgeInsets.all(16),
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
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Arabic',
                  color: Colors.grey[800],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          ...List.generate(
            question.options!.length,
            (index) => Option(
              index: index,
              text: question.options![index],
              press: () {
                if (_onTapState) {
                  _questionController.checkAnswer(question, index);
                }
                _onTapState = false;
              },
            ),
          ),
        ],
      ),
    );
  }
}
