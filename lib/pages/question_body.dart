import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_names_of/data/quiz_question_provider.dart';
import 'package:the_names_of/model/user_answer_model.dart';
import 'package:the_names_of/state/state_manager.dart';
import 'package:the_names_of/util/utils.dart';

class QuestionBody extends StatelessWidget {
  const QuestionBody({
    Key? key,
    required this.context,
    required this.userAnswers,
    required this.buttonCarouselController,
    required this.questions,
  }) : super(key: key);

  final BuildContext context;
  final List<UserAnswer> userAnswers;
  final CarouselController buttonCarouselController;
  final List<QuizQuestions> questions;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: buttonCarouselController,
      items: questions
          .asMap()
          .entries
          .map(
            (e) => Builder(
              builder: (context) {
                return Consumer(
                  builder: (context, watch, _) {
                    var userAnswerState = watch(userAnswerSelected).state;
                    var isShowAnswer = watch(isEnableShowAnswer).state;
                    return Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              AutoSizeText(context.read(isTestMode).state
                                  ? 'Номер ${e.key + 1}:${e.value.question}'
                                  : 'Номер ${e.value.id}:${e.value.question}'),
                              Expanded(
                                  child: ListTile(
                                title: AutoSizeText(
                                  '${e.value.answerA}',
                                  style: TextStyle(
                                      color: isShowAnswer
                                          ? e.value.isCorrect == 'A'
                                              ? Colors.red
                                              : Colors.grey
                                          : Colors.black),
                                ),
                                leading: Radio(
                                  value: 'A',
                                  groupValue: getGroupValue(
                                      isShowAnswer, e, userAnswerState),
                                  onChanged: (value) =>
                                      setUserAnswer(context, e, value),
                                ),
                              )),
                              Expanded(
                                  child: ListTile(
                                title: AutoSizeText(
                                  '${e.value.answerB}',
                                  style: TextStyle(
                                      color: isShowAnswer
                                          ? e.value.isCorrect == 'B'
                                              ? Colors.red
                                              : Colors.grey
                                          : Colors.black),
                                ),
                                leading: Radio(
                                  value: 'B',
                                  groupValue: getGroupValue(
                                      isShowAnswer, e, userAnswerState),
                                  onChanged: (value) =>
                                      setUserAnswer(context, e, value),
                                ),
                              )),
                              Expanded(
                                  child: ListTile(
                                title: AutoSizeText(
                                  '${e.value.answerC}',
                                  style: TextStyle(
                                      color: isShowAnswer
                                          ? e.value.isCorrect == 'C'
                                              ? Colors.red
                                              : Colors.grey
                                          : Colors.black),
                                ),
                                leading: Radio(
                                  value: 'C',
                                  groupValue: getGroupValue(
                                      isShowAnswer, e, userAnswerState),
                                  onChanged: (value) =>
                                      setUserAnswer(context, e, value),
                                ),
                              )),
                              Expanded(
                                  child: ListTile(
                                title: AutoSizeText(
                                  '${e.value.answerD}',
                                  style: TextStyle(
                                      color: isShowAnswer
                                          ? e.value.isCorrect == 'D'
                                              ? Colors.red
                                              : Colors.grey
                                          : Colors.black),
                                ),
                                leading: Radio(
                                  value: 'D',
                                  groupValue: getGroupValue(
                                      isShowAnswer, e, userAnswerState),
                                  onChanged: (value) =>
                                      setUserAnswer(context, e, value),
                                ),
                              )),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          )
          .toList(),
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        initialPage: 0,
        height: MediaQuery.of(context).size.height / 5 * 3,
        onPageChanged: (page, _) {
          context.read(currentReadPage).state = page;
          context.read(isEnableShowAnswer).state = false;
        },
      ),
    );
  }

  getGroupValue(bool isShowAnswer, MapEntry<int, QuizQuestions> e,
      UserAnswer userAnswerState) {
    return isShowAnswer
        ? e.value.isCorrect
        : (context.read(isTestMode).state
            ? context.read(userListAnswer).state[e.key].answered
            : '');
  }
}
