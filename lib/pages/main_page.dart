import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:the_names_of/data/database_query.dart';
import 'package:the_names_of/model/content_item.dart';
import 'package:the_names_of/model/name_item.dart';
import 'package:the_names_of/model/tafsir_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

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
                Color(0xFF1565C0),
                Color(0xFF2196F3),
              ],
            ),
          ),
        ),
        title: Text('Имена Аллаха'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.bars),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextWithLine('Имена', Color(0xFFEF5350)),
                FutureBuilder<List>(
                  future: _databaseQuery.getAllNames(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? _buildGridNamesContainer(snapshot)
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
                _buildTextWithButton('/names', Color(0xFFEF5350)),
                _buildTextWithLine('Разъяснение имён', Color(0xFF66BB6A)),
                FutureBuilder<List>(
                  future: _databaseQuery.getAllChapterTafsirs(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? _buildGridTafsirContainer(snapshot)
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
                _buildTextWithButton('/tafsirs', Color(0xFF66BB6A)),
                _buildTextWithLine(
                    'Краткое изложение основ', Color(0xFFFFA726)),
                FutureBuilder<List>(
                  future: _databaseQuery.getContents(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? _buildGridContentContainer(snapshot)
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
                _buildTextWithButton('/contents', Color(0xFFFFA726)),
                _buildTextWithLine('Викторина', Color(0xFF42A5F5)),
                FutureBuilder<List>(
                  future: _databaseQuery.getAllNames(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? _buildGridQuizContainer(snapshot)
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
                _buildTextWithButton('/quiz', Color(0xFF42A5F5)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextWithLine(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.all(16),
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
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextWithButton(String route, Color color) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              endIndent: 8,
              color: Colors.black,
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  /// CONTAINER NAMES */
  Widget _buildGridNamesContainer(AsyncSnapshot snapshot) {
    return Container(
      height: 150,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 0.5),
        itemBuilder: (context, index) {
          return _buildNameItem(snapshot.data[index]);
        },
      ),
    );
  }

  Widget _buildNameItem(NameItem item) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Colors.red[600],
        child: Ink(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.red[300],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${item.nameArabic}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '${item.nameTranscription}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '${item.nameTranslation}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }

  /// CONTAINER TAFSIRS */
  Widget _buildGridTafsirContainer(AsyncSnapshot snapshot) {
    return Container(
      height: 250,
      child: GridView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 0.7),
          itemBuilder: (context, index) {
            return _buildTafsirItem(snapshot.data[index]);
          }),
    );
  }

  Widget _buildTafsirItem(TafsirItem item) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Colors.green[600],
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green[300],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '${item.tafsirTitle}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ),
                Expanded(
                  child: Html(
                    data: '${item.tafsirContent}',
                    style: {
                      '#': Style(
                        fontSize: FontSize(18),
                        maxLines: 10,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      'small': Style(
                        fontSize: FontSize(14),
                        color: Colors.grey[700],
                      ),
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }

  /// CONTAINER CONTENTS */
  Widget _buildGridContentContainer(AsyncSnapshot snapshot) {
    return Container(
      height: 250,
      child: GridView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 0.7),
          itemBuilder: (context, index) {
            return _buildContentItem(snapshot.data[index]);
          }),
    );
  }

  Widget _buildContentItem(ContentItem item) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Colors.orange[600],
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.orange[300],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '${item.contentTitle}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ),
                Expanded(
                  child: Html(
                    data: '${item.content}',
                    style: {
                      '#': Style(
                        fontSize: FontSize(18),
                        textAlign: TextAlign.start,
                        maxLines: 10,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      'small': Style(
                        fontSize: FontSize(14),
                        color: Colors.grey[700],
                      ),
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// CONTAINER QUIZ */
  Widget _buildGridQuizContainer(AsyncSnapshot snapshot) {
    return Container(
      height: 150,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 0.5),
        itemBuilder: (context, index) {
          return _buildQuizItem(snapshot.data[index]);
        },
      ),
    );
  }

  Widget _buildQuizItem(NameItem item) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Colors.blue[600],
        child: Ink(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue[300],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${item.nameArabic}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '${item.nameTranscription}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '${item.nameTranslation}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
