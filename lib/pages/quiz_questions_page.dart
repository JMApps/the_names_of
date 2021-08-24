import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_names_of/data/quiz_database_helper.dart';
import 'package:the_names_of/data/quiz_question_provider.dart';
import 'package:the_names_of/model/user_answer_model.dart';
import 'package:the_names_of/pages/question_body.dart';
import 'package:the_names_of/state/state_manager.dart';

class QuizQuestionsPage extends StatefulWidget {
  const QuizQuestionsPage({Key? key}) : super(key: key);

  @override
  _QuizQuestionsPageState createState() => _QuizQuestionsPageState();
}

class _QuizQuestionsPageState extends State<QuizQuestionsPage>
    with SingleTickerProviderStateMixin {
  CarouselController carouselController = CarouselController();
  List<UserAnswer> userAnswers = <UserAnswer>[];
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Викторина'),
          backgroundColor: Colors.teal,
          leading: InkWell(
            child: Icon(CupertinoIcons.back),
            onTap: () {
              showCloseExamDialog();
            },
          ),
        ),
        body: _buildListQuestions(),
      ),
      onWillPop: () async {
        showCloseExamDialog();
        return true;
      },
    );
  }

  Widget _buildListQuestions() {
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder<List<QuizQuestions>?>(
            future: getQuestions(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                return Container(
                  margin: EdgeInsets.all(4),
                  child: Card(
                    elevation: 8,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            QuestionBody(
                              context: context,
                              userAnswers: userAnswers,
                              buttonCarouselController: carouselController,
                              questions: snapshot.data!,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<List<QuizQuestions>?> getQuestions() async {
    var db = await copyDB();
    var result = await QuestionProvider().getQuestions(db);
    userAnswers.clear();
    result!.forEach((element) {
      userAnswers.add(UserAnswer(
        questionId: element.id,
        answered: '',
        isCorrect: false,
      ));
    });
    context.read(userListAnswer).state = userAnswers;
    return result;
  }

  showCloseExamDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Конец'),
        content: Text('Вы хотите закончить?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Нет'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pop(context);
            },
            child: Text('Да'),
          ),
        ],
      ),
    );
  }
}
