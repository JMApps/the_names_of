import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui.dart';
import 'package:get/get.dart';
import 'package:the_names_of/controllers/question_russian_controller.dart';

class RussianOption extends StatelessWidget {
  const RussianOption({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionRussianController>(
      init: QuestionRussianController(),
      builder: (controller) {
        LinearGradient getTheRightGradient() {
          if (controller.isRussianAnswered) {
            if (index == controller.correctRussianAnswer) {
              return LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFF26A69A),
                  Color(0xFFB2DFDB),
                ],
              );
            } else if (index == controller.selectedRussianAnswer &&
                controller.selectedRussianAnswer != controller.correctRussianAnswer) {
              return LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFFEF5350),
                  Color(0xFFFFCDD2),
                ],
              );
            }
          }
          return LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
            ],
          );
        }

        return InkWell(
          onTap: press,
          child: Card(
            elevation: 1,
            margin: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              width: double.infinity,
              padding:
                  EdgeInsets.only(left: 32, top: 20, right: 32, bottom: 20),
              decoration: BoxDecoration(
                gradient: getTheRightGradient(),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${index + 1}. $text',
                  style: TextStyle(fontSize: 30, fontFamily: 'Arabic'),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
