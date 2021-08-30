import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:the_names_of/arguments/list_content_arguments.dart';
import 'package:the_names_of/arguments/list_name_argument.dart';
import 'package:the_names_of/arguments/list_tafsir_arguments.dart';
import 'package:the_names_of/arguments/quiz_arguments.dart';
import 'package:the_names_of/data/database_query.dart';
import 'package:the_names_of/model/content_item.dart';
import 'package:the_names_of/model/name_item.dart';
import 'package:the_names_of/model/quiz_item.dart';
import 'package:the_names_of/model/tafsir_item.dart';
import 'package:the_names_of/pages/support_project_page.dart';

class MainPage extends StatefulWidget {
  final zoomDrawerController;

  MainPage(this.zoomDrawerController);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _databaseQuery = DatabaseQuery();

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
        title: Text('Имена Аллаха'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.bars),
          onPressed: () {
            if (!widget.zoomDrawerController.isOpen()) {
              widget.zoomDrawerController.open();
            } else {
              widget.zoomDrawerController.close();
            }
          },
        ),
        actions: [
          SupportProjectPage(),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextWithLine(
                    'Краткое изложение основ', Color(0xFFEF6C00)),
                _buildGridContentContainer(),
                _buildTextWithButton('/contents', Color(0xFFFB8C00)),
                _buildTextWithLine('Имена', Color(0xFFC62828)),
                _buildGridNamesContainer(),
                _buildTextWithButton('/names', Color(0xFFE53935)),
                _buildTextWithLine('Разъяснение имён', Color(0xFF2E7D32)),
                _buildGridTafsirContainer(),
                _buildTextWithButton('/tafsirs', Color(0xFF43A047)),
                _buildTextWithLine('Викторина', Color(0xFF1565C0)),
                Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 8),
                  child: Text(
                    'Арабско-русский',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildGridArabicQuizContainer(),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 8),
                  child: Text(
                    'Русско-арабский',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildGridRussianQuizContainer(),
                _buildTextWithButton('/quiz', Color(0xFF1E88E5)),
                _buildTextWithLine('Карточки', Color(0xFF424242)),
                _buildGridCardNamesContainer(),
                _buildTextWithButton('/cards', Color(0xFF616161)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextWithLine(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$text',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
          Expanded(
            child: Divider(
              indent: 8,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextWithButton(String route, Color color) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              endIndent: 8,
              color: color,
            ),
          ),
          FlatButton.icon(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            color: color,
            label: Text(
              'Перейти...',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            icon: Icon(
              CupertinoIcons.chevron_right_circle_fill,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pushNamed('$route');
            },
          ),
        ],
      ),
    );
  }

  /// CONTAINER CONTENTS */
  Widget _buildGridContentContainer() {
    return FutureBuilder<List>(
      future: _databaseQuery.getAllContents(),
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Container(
                height: 250,
                child: GridView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      return _buildContentItem(snapshot.data![index]);
                    }),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget _buildContentItem(ContentItem item) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(width: 1, color: Colors.orange),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Colors.orange,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.orange[200],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${item.id}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        '${item.contentTitle}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 16),
                  child: Html(
                    data: '${item.content}',
                    style: {
                      '#': Style(
                        fontSize: FontSize(18),
                        textAlign: TextAlign.start,
                        textOverflow: TextOverflow.fade,
                      ),
                      'small': Style(
                        fontSize: FontSize(14),
                        color: Colors.grey[700],
                      ),
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context, rootNavigator: true).pushNamed(
            '/contents',
            arguments: ListContentArguments(item.id),
          );
        },
      ),
    );
  }

  /// CONTAINER NAMES */
  Widget _buildGridNamesContainer() {
    return FutureBuilder<List>(
      future: _databaseQuery.getAllNames(),
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Container(
                height: 150,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 0.5),
                  itemBuilder: (context, index) {
                    return _buildNameItem(snapshot.data![index]);
                  },
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget _buildNameItem(NameItem item) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(width: 1, color: Colors.red),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Colors.red,
        child: Ink(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.red[200],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${item.id}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${item.nameArabic}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontFamily: 'Arabic'),
                  ),
                  Text(
                    '${item.nameTranscription}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.green[900]),
                  ),
                  Text(
                    '${item.nameTranslation}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context, rootNavigator: true)
              .pushNamed('/names', arguments: ListNameArguments(item.id));
        },
      ),
    );
  }

  /// CONTAINER TAFSIRS */
  Widget _buildGridTafsirContainer() {
    return FutureBuilder<List>(
      future: _databaseQuery.getAllChapterTafsirs(),
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Container(
                height: 250,
                child: GridView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      return _buildTafsirItem(snapshot.data![index]);
                    }),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget _buildTafsirItem(TafsirItem item) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(width: 1, color: Colors.green),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Colors.green,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green[200],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${item.id}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        '${item.tafsirTitle}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 16),
                  child: Html(
                    data: '${item.tafsirContent}',
                    style: {
                      '#': Style(
                        fontSize: FontSize(18),
                        textAlign: TextAlign.start,
                        textOverflow: TextOverflow.fade,
                      ),
                      'small': Style(
                        fontSize: FontSize(14),
                        color: Colors.grey[700],
                      ),
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context, rootNavigator: true).pushNamed(
            '/tafsirs',
            arguments: ListTafsirArguments(item.id),
          );
        },
      ),
    );
  }

  /// CONTAINER ARABIC QUIZ */
  Widget _buildGridArabicQuizContainer() {
    return FutureBuilder<List>(
      future: _databaseQuery.getArabicQuizNames(),
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Container(
                height: 150,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 0.5),
                  itemBuilder: (context, index) {
                    return _buildArabicQuizItem(snapshot.data![index]);
                  },
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget _buildArabicQuizItem(QuizItem item) {
    Color? getTheRightColor() {
      if (item.answerState == 0) {
        return Colors.green[700];
      } else if (item.answerState == 1) {
        return Colors.red[700];
      }
      return Colors.grey[200];
    }

    IconData getTheRightIcon() {
      if (item.answerState == 0) {
        return CupertinoIcons.checkmark_alt;
      } else if (item.answerState == 1) {
        return CupertinoIcons.clear;
      }
      return CupertinoIcons.checkmark_alt;
    }

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8),
      color: Colors.blue[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(width: 1, color: Colors.blue),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Colors.blue,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${item.id}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.all(16),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border:
                              Border.all(color: getTheRightColor()!, width: 1),
                          color: getTheRightColor()),
                      child: Center(
                        child: Icon(
                          getTheRightIcon(),
                          color: Colors.grey[200],
                          size: 20,
                        ),
                      ),
                    ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${item.question}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontFamily: 'Arabic'),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, '/quiz_question',
              arguments: QuizArguments(0));
        },
      ),
    );
  }

  /// CONTAINER RUSSIAN QUIZ */
  Widget _buildGridRussianQuizContainer() {
    return FutureBuilder<List>(
      future: _databaseQuery.getRussianQuizNames(),
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Container(
                height: 150,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 0.5),
                  itemBuilder: (context, index) {
                    return _buildRussianQuizItem(snapshot.data![index]);
                  },
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget _buildRussianQuizItem(QuizItem item) {
    Color? getTheRightColor() {
      if (item.answerState == 0) {
        return Colors.green[700];
      } else if (item.answerState == 1) {
        return Colors.red[700];
      }
      return Colors.grey[200];
    }

    IconData getTheRightIcon() {
      if (item.answerState == 0) {
        return CupertinoIcons.checkmark_alt;
      } else if (item.answerState == 1) {
        return CupertinoIcons.clear;
      }
      return CupertinoIcons.checkmark_alt;
    }

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8),
      color: Colors.red[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(width: 1, color: Colors.red),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Colors.red,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${item.id}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border:
                              Border.all(color: getTheRightColor()!, width: 1),
                          color: getTheRightColor()),
                      child: Center(
                        child: Icon(
                          getTheRightIcon(),
                          color: Colors.grey[200],
                          size: 20,
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                '${item.question}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, '/quiz_question',
              arguments: QuizArguments(1));
        },
      ),
    );
  }

  /// CONTAINER NAMES */
  Widget _buildGridCardNamesContainer() {
    return FutureBuilder<List>(
      future: _databaseQuery.getAllNames(),
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Container(
                height: 150,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 0.5),
                  itemBuilder: (context, index) {
                    return _buildCardNameItem(snapshot.data![index]);
                  },
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget _buildCardNameItem(NameItem item) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(width: 1, color: Colors.grey),
      ),
      child: Ink(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Center(
                  child: Text(
                    '${item.id}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${item.nameArabic}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Arabic',
                  ),
                ),
                Text(
                  '${item.nameTranscription}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
                Text(
                  '${item.nameTranslation}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
