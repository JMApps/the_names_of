import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_names_of/arguments/list_card_name_arguments.dart';
import 'package:the_names_of/data/database_query.dart';
import 'package:the_names_of/model/name_item.dart';

class CardNamesPage extends StatefulWidget {
  const CardNamesPage({Key? key}) : super(key: key);

  @override
  _CardNamesPageState createState() => _CardNamesPageState();
}

class _CardNamesPageState extends State<CardNamesPage> {
  var random = Random();
  late ListCardNameArguments? args;
  var _databaseQuery = DatabaseQuery();
  final _itemScrollController = ItemScrollController();

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
    args = ModalRoute.of(context)!.settings.arguments as ListCardNameArguments?;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF616161),
                Color(0xFF9E9E9E),
              ],
            ),
          ),
        ),
        title: Text('Карточки'),
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
                        Color(0xFFE0E0E0),
                        Color(0xFFFFFFFF),
                      ],
                    ),
                  ),
                  child: _buildListCardNames(snapshot),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Widget _buildListCardNames(AsyncSnapshot snapshot) {
    return Scrollbar(
      child: ScrollablePositionedList.builder(
        itemScrollController: _itemScrollController,
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return _buildCardNameItem(snapshot.data[index]);
        },
      ),
    );
  }

  Widget _buildCardNameItem(NameItem item) {
    return FlipCard(
      front: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(width: 1, color: Colors.grey),
        ),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [
                Color(0xFFD6D6D6),
                Color(0xFFFAFAFA),
              ],
            ),
          ),
          child: Center(
            child: Text(
              '${item.nameArabic}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.grey[800]),
            ),
          ),
        ),
      ),
      back: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(width: 1, color: Colors.grey)),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFFD6D6D6),
                Color(0xFFFAFAFA),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${item.nameTranscription}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.teal[700]),
              ),
              SizedBox(height: 8),
              Text(
                '${item.nameTranslation}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
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
}