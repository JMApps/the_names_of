import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui.dart';
import 'package:get/get.dart';
import 'package:the_names_of/controllers/question_controller.dart';

class Option extends StatelessWidget {
  const Option(
      {Key? key, required this.text, required this.index, required this.press})
      : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (controller) {
        Color getTheRightColor() {
          if (controller.isAnswered) {
            if (index == controller.correctAnswer) {
              return Colors.teal;
            } else if (index == controller.selectedAnswer &&
                controller.selectedAnswer != controller.correctAnswer) {
              return Colors.red;
            }
          }
          return Colors.grey;
        }

        IconData getRightIcon() {
          return getTheRightColor() == Colors.red
              ? CupertinoIcons.clear
              : CupertinoIcons.checkmark_alt;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              border: Border.all(color: getTheRightColor()),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${index + 1}. $text',
                    style: TextStyle(
                      color: getTheRightColor(),
                      fontSize: 22,
                    ),
                  ),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == Colors.grey
                        ? Colors.transparent
                        : getTheRightColor(),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: getTheRightColor()),
                  ),
                  child: getTheRightColor() == Colors.grey
                      ? null
                      : Icon(
                          getRightIcon(),
                          size: 16,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
