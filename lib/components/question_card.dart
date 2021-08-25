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
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xFFE0F7FA),
              Color(0xFFFFFFFF),
            ],
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            SizedBox(height: 16),
            Text(
              question.question!,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                fontFamily: 'Arabic',
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 16),
            ...List.generate(
              question.options!.length,
              (index) => Option(
                index: index,
                text: question.options![index],
                press: () {
                  _questionController.checkAnswer(question, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
