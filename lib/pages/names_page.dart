import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_names_of/arguments/list_name_argument.dart';
import 'package:the_names_of/data/database_query.dart';
import 'package:the_names_of/model/name_item.dart';

class NamesPage extends StatefulWidget {
  const NamesPage({Key? key}) : super(key: key);

  @override
  _NamesPageState createState() => _NamesPageState();
}

class _NamesPageState extends State<NamesPage> {
  var _databaseQuery = DatabaseQuery();
  late ListNameArguments? args;
  final _itemScrollController = ItemScrollController();
  var random = Random();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ListNameArguments?;
    return Scaffold(
      appBar: AppBar(
        title: Text('Список имён'),
        centerTitle: true,
        backgroundColor: Colors.red[400],
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.arrow_2_squarepath),
            onPressed: () {
              scrollToIndex(
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
                        Color(0xFFFFCDD2),
                        Color(0xFFFFEBEE),
                      ],
                    ),
                  ),
                  child: _buildListNames(snapshot),
                )
              : Container(
                  color: Colors.red[50],
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
        },
      ),
    );
  }

  Widget _buildListNames(AsyncSnapshot snapshot) {
    return ScrollablePositionedList.builder(
      itemScrollController: _itemScrollController,
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return _buildNameItem(snapshot.data[index]);
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
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
          ],
        ),
      ),
    );
  }

  scrollToIndex(int index) async {
    await _itemScrollController.scrollTo(
        index: index,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOutCubic);
  }
}
