import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:the_names_of/arguments/quiz_arguments.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> quizCategories = [
    'Арабско-русский вариант',
    'Русско-арабский вариант',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF1976D2),
                Color(0xFF64B5F6),
              ],
            ),
          ),
        ),
        title: Text('Режим викторины'),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFE3F2FD),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: _buildCategoriesList(),
      ),
    );
  }

  Widget _buildCategoriesList() {
    return ListView(
      children: [
        _buildItemCategory(0),
        _buildItemCategory(1),
      ],
    );
  }

  Widget _buildItemCategory(int index) {
    return Card(
      elevation: 1,
      shadowColor: Colors.blue,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Colors.blue[200],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.only(left: 16, top: 50, right: 16, bottom: 50),
          child: TextButton.icon(
            onPressed: null,
            label: Text(
              '${quizCategories[index]}',
              style: TextStyle(fontSize: 20, color: Colors.grey[800]),
              textAlign: TextAlign.center,
            ),
            icon: Icon(
              Icons.translate,
              color: Colors.blue,
            ),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/quiz_question',
              arguments: QuizArguments(index));
        },
      ),
    );
  }
}
