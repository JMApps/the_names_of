import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_names_of/data/quiz_question_provider.dart';
import 'package:the_names_of/model/user_answer_model.dart';
import 'package:the_names_of/state/state_manager.dart';

setUserAnswer(BuildContext context, MapEntry<int, QuizQuestions> e, value) {
  context.read(userListAnswer).state[e.key] =
      context.read(userAnswerSelected).state = UserAnswer(
          questionId: e.value.id,
          answered: value,
          isCorrect: value.toString().isNotEmpty
              ? value.toString().toLowerCase() ==
                  e.value.isCorrect!.toLowerCase()
              : false);
}

showAnswer(BuildContext context) {
  context.read(isEnableShowAnswer).state = true;
}
