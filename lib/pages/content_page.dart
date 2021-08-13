import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:the_names_of/arguments/list_content_arguments.dart';
import 'package:the_names_of/data/database_query.dart';
import 'package:the_names_of/model/content_item.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  var _pageViewController = PageController();
  var _databaseQuery = DatabaseQuery();
  late ListContentArguments? args;

  int _selectedPage = 0;

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ListContentArguments?;
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
                Color(0xFFF57C00),
                Color(0xFFFFB74D),
              ],
            ),
          ),
        ),
        title: Text('Изложение основ'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFFFF3E0),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: _buildContentPage(),
      ),
    );
  }

  Widget _buildContentPage() {
    return Column(
      children: [
        _buildDotIndicator(_selectedPage, 16, Colors.orange),
        Expanded(
          child: PageView.builder(
            onPageChanged: (page) {
              setState(() {
                _selectedPage = page;
              });
            },
            controller: _pageViewController,
            itemCount: 16,
            itemBuilder: (context, index) {
              return Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildContent(index),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
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

  Widget _buildContent(int pageIndex) {
    return FutureBuilder<List>(
      future: _databaseQuery.getChapterContents(pageIndex + 1),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return _buildContentItem(snapshot.data![index]);
                },
              )
            : SizedBox();
      },
    );
  }

  Widget _buildContentItem(ContentItem item) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 1,
          shadowColor: Colors.orange,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFFFFCC80),
                  Color(0xFFFFF3E0),
                ],
              ),
            ),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            child: Text(
              '${item.contentTitle}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 1,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SelectableHtml(
              data: item.content,
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
        ),
      ],
    );
  }
}
