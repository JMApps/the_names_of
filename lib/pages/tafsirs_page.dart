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
  var _pageNameController = PageController();
  var _pageAyahController = PageController();
  var _databaseQuery = DatabaseQuery();
  late ListTafsirArguments? args;

  int _selectedPage = 0;
  int _selectedName = 0;
  int _selectedAyah = 0;

  @override
  void dispose() {
    _pageViewController.dispose();
    _pageNameController.dispose();
    _pageAyahController.dispose();
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
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFE8F5E9),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: _buildTafsirPage(),
      ),
    );
  }

  Widget _buildTafsirPage() {
    return Column(
      children: [
        _buildDotIndicator(_selectedPage, 65, Colors.green),
        Expanded(
          child: PageView.builder(
            onPageChanged: (page) {
              setState(() {
                _selectedPage = page;
              });
            },
            controller: _pageViewController,
            itemCount: 65,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _buildListNames(index),
                    _buildListAyahs(index),
                    _buildTafsir(index),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildListNames(int pageIndex) {
    return FutureBuilder<List>(
      future: _databaseQuery.getChapterNames(pageIndex + 1),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Column(
                children: [
                  Container(
                    height: 200,
                    child: PageView.builder(
                      controller: _pageNameController,
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      onPageChanged: (page) {
                        setState(() {
                          _selectedName = page;
                        });
                      },
                      itemBuilder: (context, index) {
                        return _buildNameItem(snapshot.data![index]);
                      },
                    ),
                  ),
                  _buildDotIndicator(
                      _selectedName, snapshot.data!.length, Colors.red),
                ],
              )
            : SizedBox();
      },
    );
  }

  Widget _buildNameItem(NameItem item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
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

  Widget _buildListAyahs(int pageIndex) {
    return FutureBuilder<List>(
      future: _databaseQuery.getChapterAyahs(pageIndex + 1),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: PageView.builder(
                      controller: _pageAyahController,
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      onPageChanged: (page) {
                        setState(() {
                          _selectedAyah = page;
                        });
                      },
                      itemBuilder: (context, index) {
                        return snapshot.hasData
                            ? _buildAyahItem(snapshot.data[index])
                            : SizedBox();
                      },
                    ),
                  ),
                  snapshot.data!.length > 0
                      ? _buildDotIndicator(
                          _selectedAyah, snapshot.data!.length, Colors.red)
                      : SizedBox(),
                ],
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
      shadowColor: Colors.red[200],
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 4, right: 16, bottom: 4),
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
