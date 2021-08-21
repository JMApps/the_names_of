import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:the_names_of/arguments/list_tafsir_arguments.dart';
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
  var _pageViewController = PageController();

  var _databaseQuery = DatabaseQuery();
  late ListTafsirArguments? args;

  int _selectedPage = 0;

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ListTafsirArguments?;
    _pageViewController =
        PageController(initialPage: args != null ? args!.id! - 1 : 0);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF388E3C),
                Color(0xFF81C784),
              ],
            ),
          ),
        ),
        title: Text('Разъяснение имён'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE8F5E9),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: Container(
            child: Column(
          children: [
            _buildDotIndicator(_selectedPage, 65, Colors.green),
            Expanded(
              child: _buildTafsirPage(),
            ),
          ],
        )),
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
      controller: _pageViewController,
      itemCount: 65,
      itemBuilder: (context, index) {
        return Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildListNames(index),
                _buildListAyahs(index),
                _buildTafsir(index),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListNames(int pageIndex) {
    return FutureBuilder<List>(
      future: _databaseQuery.getChapterNames(pageIndex + 1),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData ? _buildChapterNamesList(snapshot) : SizedBox();
      },
    );
  }

  Widget _buildChapterNamesList(AsyncSnapshot snapshot) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: ClampingScrollPhysics(),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        return _buildNameItem(snapshot.data![index], index);
      },
    );
  }

  Widget _buildNameItem(NameItem item, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 1,
      shadowColor: Colors.green,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color(0xFFE8F5E9),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        padding: EdgeInsets.only(left: 16, top: 4, right: 16, bottom: 4),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.all(8),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Center(
                  child: Text(
                    '${item.id}',
                    style: TextStyle(
                      fontSize: 15,
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
                SizedBox(height: 8),
                Text(
                  '${item.nameArabic}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.red,
                    fontFamily: 'Arabic',
                  ),
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
          ],
        ),
      ),
    );
  }

  Widget _buildListAyahs(int pageIndex) {
    return FutureBuilder<List>(
      future: _databaseQuery.getChapterAyahs(pageIndex + 1),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: ClampingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return snapshot.hasData
                      ? _buildAyahItem(snapshot.data[index])
                      : SizedBox();
                },
              )
            : SizedBox();
      },
    );
  }

  Widget _buildAyahItem(AyahItem item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 1,
      shadowColor: Colors.red,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFFFEBEE),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        padding: EdgeInsets.only(left: 16, top: 4, right: 16, bottom: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${item.ayahArabic}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.red,
                  fontFamily: 'Arabic',
                ),
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

  Widget _buildTafsir(int pageIndex) {
    return FutureBuilder(
      future: _databaseQuery.getChapterTafsirs(pageIndex + 1),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return _buildTafsirItem(snapshot.data[index]);
                },
              )
            : SizedBox();
      },
    );
  }

  Widget _buildTafsirItem(TafsirItem item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      shadowColor: Colors.grey,
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

  Widget _buildDotIndicator(int selectPage, int count, Color selectedColor) {
    return Container(
      padding: EdgeInsets.all(8),
      child: PageViewDotIndicator(
        currentItem: selectPage,
        count: count,
        selectedColor: selectedColor,
        unselectedColor: Colors.grey,
        duration: Duration(milliseconds: 200),
        size: Size(8, 8),
        unselectedSize: Size(5, 5),
      ),
    );
  }
}
