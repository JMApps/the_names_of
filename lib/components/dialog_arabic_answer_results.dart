import 'package:flutter/material.dart';
import 'package:the_names_of/controllers/question_arabic_controller.dart';
import 'package:the_names_of/data/database_query.dart';

class DialogArabicAnswerResults extends StatelessWidget {
  const DialogArabicAnswerResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _databaseQuery = DatabaseQuery();
    var questionArabicController = QuestionArabicController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Ваши ответы'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: FutureBuilder<List?>(
          future: _databaseQuery.getArabicQuizNames(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Scrollbar(
                    child: SingleChildScrollView(
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5, childAspectRatio: 1),
                        itemBuilder: (context, index) {
                          Color? getTheRightColor() {
                            if (snapshot.data![index].answerState == 0) {
                              return Colors.green[200];
                            } else if (snapshot.data![index].answerState == 1) {
                              return Colors.red[200];
                            }
                            return Colors.grey[200];
                          }

                          return Card(
                            margin: EdgeInsets.all(4),
                            color: getTheRightColor(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(width: 1, color: Colors.orange),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(15),
                              splashColor: Colors.orange,
                              child: Center(
                                child: Text(
                                  '${snapshot.data![index].id}',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.blueGrey),
                                ),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return _buildAlertDialog(
                                        questionArabicController, index);
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }

  Widget _buildAlertDialog(
      QuestionArabicController questionArabicController, int index) {
    return AlertDialog(
      title: Text(
        'Вопрос №${index + 1}',
        style: TextStyle(fontSize: 22, color: Colors.orange),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Вопрос',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: double.infinity,
                padding:
                    EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFF64B5F6),
                      Color(0xFFBBDEFB),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  '${questionArabicController.arabicQuestions[index].question}',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Arabic',
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Правильный ответ',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFF26A69A),
                      Color(0xFFB2DFDB),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  '${questionArabicController.arabicQuestions[index].options![questionArabicController.arabicQuestions[index].answer!]}',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
