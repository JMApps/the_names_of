import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_names_of/arguments/list_content_arguments.dart';
import 'package:the_names_of/data/database_query.dart';
import 'package:the_names_of/model/content_item.dart';
import 'package:html/parser.dart';

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
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        _pageViewController
            .jumpToPage(args != null ? args!.id! - 1 : _selectedPage);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    args = ModalRoute.of(context)!.settings.arguments as ListContentArguments?;
    _pageViewController = PageController();
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
        child: _buildContentPage(size),
      ),
    );
  }

  Widget _buildContentPage(Size size) {
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
                      FutureBuilder<List>(
                        future: _databaseQuery.getChapterContents(index + 1),
                        builder: (context, snapshot) {
                          return Padding(
                            padding: EdgeInsets.only(top: 8, bottom: 16),
                            child: TextButton.icon(
                              onPressed: () {
                                FlutterClipboard.copy(
                                  _parseHtmlString(
                                      '${snapshot.data![0].contentTitle}\n\n${snapshot.data![0].content}'),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.orange,
                                    content: Text(
                                      'Скопировано',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 500),
                                  ),
                                );
                              },
                              label: Text(
                                'Скопировать главу',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.orange,
                                ),
                              ),
                              icon: Icon(
                                CupertinoIcons.doc_on_doc,
                                size: 25,
                                color: Colors.orange,
                              ),
                            ),
                          );
                        },
                      ),
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
                padding: EdgeInsets.zero,
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

  String _parseHtmlString(String htmlString) {
    final documentText = parse(htmlString);
    final String parsedString =
        parse(documentText.body!.text).documentElement!.text;
    return parsedString;
  }
}
