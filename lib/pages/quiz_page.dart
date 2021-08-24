import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
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
        title: Text('Викторина'),
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
        child: _buildQuizCategoriesList(),
      ),
    );
  }

  Widget _buildQuizCategoriesList() {
    return FutureBuilder<List>(
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: SelectableText('${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          return _buildCategoriesList(snapshot);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildCategoriesList(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        return _buildItemCategory(snapshot.data![index]);
      },
    );
  }

  Widget _buildItemCategory() {
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
          child: Text(
            '${item.categoryName}',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        onTap: () {
          //Navigator.pushNamed(context, '/quiz_questions');
        },
      ),
    );
  }
}
