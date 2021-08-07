import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_names_of/data/database_query.dart';
import 'package:the_names_of/model/name_item.dart';

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
      body: FutureBuilder<List>(
        future: _databaseQuery.getAllNames(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTextWithLine('Имена', Color(0xFFEF5350)),
                          _buildGridNamesContainer(snapshot),
                          _buildTextWithButton('/names', Color(0xFFEF5350)),
                          _buildTextWithLine(
                              'Толкование имён', Color(0xFF66BB6A)),
                          _buildGridTafsirContainer(),
                          _buildTextWithButton('/tafsirs', Color(0xFF66BB6A)),
                          _buildTextWithLine(
                              'Краткое изложение основ', Color(0xFFFFA726)),
                          _buildGridContentContainer(),
                          _buildTextWithButton('/contents', Color(0xFFFFA726)),
                          _buildTextWithLine('Викторина', Color(0xFF42A5F5)),
                          _buildGridQuizContainer(),
                          _buildTextWithButton('/quiz', Color(0xFF42A5F5)),
                        ],
                      ),
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
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
  Widget _buildGridTafsirContainer() {
    return Container(
      height: 250,
      child: GridView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemBuilder: (context, index) {
            return _buildTafsirItem();
          }),
    );
  }

  Widget _buildTafsirItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.green[100],
      ),
      child: ListTile(
        title: Text(
          'Name arabic fepirgfperojgpoerjgperojgoperjgpoerjgpoerjgpoerjgp',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  /// CONTAINER CONTENTS */
  Widget _buildGridContentContainer() {
    return Container(
      height: 250,
      child: GridView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemBuilder: (context, index) {
            return _buildContentItem();
          }),
    );
  }

  Widget _buildContentItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.orange[100],
      ),
      child: ListTile(
        title: Text(
          'Name arabic fep23r23r23r23irgfperojgpoerjgperojgoperjgpoerjgpoerjgpoerjgp',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  /// CONTAINER QUIZ */
  Widget _buildGridQuizContainer() {
    return Container(
      height: 125,
      child: GridView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemBuilder: (context, index) {
            return _buildQuizItem();
          }),
    );
  }

  Widget _buildQuizItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue[100],
      ),
      child: Center(
        child: ListTile(
          title: Text('Name arabic'),
          subtitle: Text('Name Translation'),
        ),
      ),
    );
  }
}
