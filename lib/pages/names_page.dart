import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_names_of/arguments/list_name_argument.dart';
import 'package:the_names_of/data/database_query.dart';
import 'package:the_names_of/model/name_item.dart';

class NamesPage extends StatefulWidget {
  const NamesPage({Key? key}) : super(key: key);

  @override
  _NamesPageState createState() => _NamesPageState();
}

class _NamesPageState extends State<NamesPage> {
  var random = Random();
  late ListNameArguments? args;
  var _databaseQuery = DatabaseQuery();
  final _itemScrollController = ItemScrollController();
  final _screenshotController = ScreenshotController();

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      if (args?.id! != null) {
        _scrollToIndex(args!.id! - 1);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ListNameArguments?;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFFD32F2F),
                Color(0xFFE57373),
              ],
            ),
          ),
        ),
        title: Text('Список имён'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.arrow_2_squarepath),
            onPressed: () {
              _scrollToIndex(
                random.nextInt(99),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List>(
        future: _databaseQuery.getAllNames(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xFFFFEBEE),
                        Color(0xFFFFFFFF),
                      ],
                    ),
                  ),
                  child: _buildListNames(snapshot),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Widget _buildListNames(AsyncSnapshot snapshot) {
    return Scrollbar(
      child: ScrollablePositionedList.builder(
        itemScrollController: _itemScrollController,
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return _buildNameItem(snapshot.data[index]);
        },
      ),
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
            Divider(
              indent: 16,
              endIndent: 16,
              color: Colors.red,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.red[500],
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.doc_on_doc,
                    color: Colors.red[500],
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.red[500],
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.image,
                    color: Colors.red[500],
                  ),
                  onPressed: () {
                    _takeScreenshot(item);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _scrollToIndex(int index) async {
    await _itemScrollController.scrollTo(
        index: index,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOutCubic);
  }

  Widget _forScreen(NameItem item) {
    return Screenshot(
      controller: _screenshotController,
      child: AspectRatio(
        aspectRatio: MediaQuery.of(context).size.aspectRatio * 5,
        child: Card(
          margin: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 1,
          shadowColor: Colors.red[200],
          child: Column(
            children: [
              SizedBox(height: 16),
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
              SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }

  _takeScreenshot(NameItem item) async {
    final unit8List =
        await _screenshotController.captureFromWidget(_forScreen(item));
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/image_${item.id}.jpg');
    await file.writeAsBytes(unit8List);
    await Share.shareFiles([file.path]);
  }
}
