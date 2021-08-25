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
    late bool _tapState = true;
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (controller) {
        Color getTheRightColor() {
          if (controller.isAnswered) {
            if (index == controller.correctAnswer) {
              print('$_tapState');
              _tapState = false;
              return Colors.teal;
            } else if (index == controller.selectedAnswer &&
                controller.selectedAnswer != controller.correctAnswer) {
              _tapState = false;
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
          onTap: _tapState ? press : null,
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 32),
            decoration: BoxDecoration(
              border: Border.all(color: getTheRightColor()),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${index + 1}. $text',
                    style: TextStyle(
                      color: getTheRightColor(),
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == Colors.grey[700]
                        ? Colors.transparent
                        : getTheRightColor(),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: getTheRightColor()),
                  ),
                  child: getTheRightColor() == Colors.grey[700]
                      ? null
                      : Icon(
                          getRightIcon(),
                          size: 16,
                          color: Colors.white,
                        ),
                ),
                SizedBox(width: 8),
              ],
            ),
          ),
        );
      },
    );
  }
}
