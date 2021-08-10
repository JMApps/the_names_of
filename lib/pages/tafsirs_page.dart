import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:the_names_of/data/database_query.dart';
import 'package:the_names_of/model/ayah_item.dart';
import 'package:the_names_of/model/name_item.dart';
import 'package:the_names_of/model/tafsir_item.dart';

class TafsirsPage extends StatefulWidget {
  const TafsirsPage({Key? key}) : super(key: key);

  @override
  _TafsirsPageState createState() => _TafsirsPageState();
}

class _TafsirsPageState extends State<TafsirsPage> {
  var _pageController = PageController();
  var _databaseQuery = DatabaseQuery();

  int _selectedPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _pageController = PageController(initialPage: _selectedPage);
    return Scaffold(
      appBar: AppBar(
        title: Text('Разъяснение имён'),
        centerTitle: true,
        backgroundColor: Colors.green[400],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFE8F5E9),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 100,
              padding: EdgeInsets.all(8),
              child: PageViewDotIndicator(
                currentItem: _selectedPage,
                count: 65,
                selectedColor: Color(0xFF2E7D32),
                unselectedColor: Colors.grey,
                duration: Duration(milliseconds: 200),
                size: Size(8, 8),
                unselectedSize: Size(5, 5),
              ),
            ),
            Expanded(
              child: _buildTafsirPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTafsirPage() {
    return PageView.builder(
      onPageChanged: (page) {
        setState(() {
          _selectedPage = page;
        });
      },
      controller: _pageController,
      itemCount: 65,
      itemBuilder: (context, index) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildListNames(index),
              _buildListAyahs(index),
              _buildTafsir(index),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListNames(int pageNumber) {
    return FutureBuilder(
      future: _databaseQuery.getChapterNames(pageNumber + 1),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          height: 200,
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: snapshot.data?.length ?? 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 0.5),
            itemBuilder: (context, index) {
              return snapshot.hasData
                  ? _buildNameItem(snapshot.data[index])
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        );
      },
    );
  }

  Widget _buildNameItem(NameItem item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      shadowColor: Colors.red[200],
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 4, right: 16, bottom: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8),
            Text(
              '${item.nameArabic}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            SizedBox(height: 8),
            Text(
              '${item.nameTranscription}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 8),
            Text(
              '${item.nameTranslation}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildListAyahs(int pageNumber) {
    return FutureBuilder(
      future: _databaseQuery.getChapterAyahs(pageNumber + 1),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemCount: snapshot.data?.length ?? 1,
          itemBuilder: (context, index) {
            return snapshot.hasData
                ? _buildAyahItem(snapshot.data[index])
                : Center(
                    child: SizedBox(),
                  );
          },
        );
      },
    );
  }

  Widget _buildAyahItem(AyahItem item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      shadowColor: Colors.red[200],
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 4, right: 16, bottom: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${item.ayahArabic}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
            SizedBox(height: 8),
            Text(
              '${item.ayahTranslation}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${item.ayahSource}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildTafsir(int pageNumber) {
    return FutureBuilder(
      future: _databaseQuery.getChapterTafsirs(pageNumber + 1),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: snapshot.data?.length ?? 1,
          itemBuilder: (context, index) {
            return snapshot.hasData
                ? _buildTafsirItem(snapshot.data[index])
                : Center(
                    child: SizedBox(),
                  );
          },
        );
      },
    );
  }

  Widget _buildTafsirItem(TafsirItem item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      shadowColor: Colors.red[200],
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 4, right: 16, bottom: 4),
        child: Html(
          data: item.tafsirContent,
          style: {
            '#': Style(
              fontSize: FontSize(20),
            ),
            'small': Style(
              fontSize: FontSize(14),
              color: Colors.grey[600],
            )
          },
        ),
      ),
    );
  }
}
