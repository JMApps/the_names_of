import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
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
  late AssetsAudioPlayer audioPlayer;
  List<dynamic> listNames = [];
  bool _fontBackBackFrontState = false;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      if (args?.id! != null) {
        _scrollToIndex(args!.id! - 1);
      }
    });
    audioPlayer = AssetsAudioPlayer();
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
            icon: Icon(CupertinoIcons.creditcard_fill),
            onPressed: () {
              setState(() {
                _fontBackBackFrontState = !_fontBackBackFrontState;
                _setupPlayer();
              });
            },
          ),
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
      body: _buildFutureCardNames(),
    );
  }

  Widget _buildFutureCardNames() {
    return FutureBuilder<List>(
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
    );
  }

  Widget _buildListCardNames(AsyncSnapshot snapshot) {
    listNames = snapshot.data!;
    listNames.shuffle();
    _setupPlayer();
    return Scrollbar(
      child: ScrollablePositionedList.builder(
        itemScrollController: _itemScrollController,
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return _buildCardNameItem(listNames[index], index);
        },
      ),
    );
  }

  Widget _buildCardNameItem(NameItem item, int index) {
    return FlipCard(
      front: _fontBackBackFrontState
          ? _buildBackCard(item, index)
          : _buildFrontCard(item, index),
      back: _fontBackBackFrontState
          ? _buildFrontCard(item, index)
          : _buildBackCard(item, index),
    );
  }

  Widget _buildFrontCard(NameItem item, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 1,
      child: Container(
        height: 250,
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
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.all(16),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: audioPlayer.builderRealtimePlayingInfos(
                    builder: (context, realtimePLayingInfo) {
                      return IconButton(
                        iconSize: 35,
                        icon: Icon(
                          realtimePLayingInfo.isPlaying &&
                                  _assignPlayValue(index)
                              ? CupertinoIcons.stop_circle
                              : CupertinoIcons.play_circle,
                          color: Colors.grey[700],
                        ),
                        onPressed: () {
                          if (audioPlayer.readingPlaylist!.currentIndex ==
                              index) {
                            if (realtimePLayingInfo.isPlaying) {
                              audioPlayer.stop();
                            } else {
                              audioPlayer.playlistPlayAtIndex(index);
                            }
                          } else {
                            audioPlayer.playlistPlayAtIndex(index);
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
              Text(
                '${item.nameArabic}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.grey[800],
                  fontFamily: 'Arabic',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackCard(NameItem item, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 1,
      child: Container(
        height: 250,
        padding: EdgeInsets.all(8),
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
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.all(8),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.teal[700],
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: audioPlayer.builderRealtimePlayingInfos(
                  builder: (context, realtimePLayingInfo) {
                    return IconButton(
                      iconSize: 35,
                      icon: Icon(
                        realtimePLayingInfo.isPlaying && _assignPlayValue(index)
                            ? CupertinoIcons.stop_circle
                            : CupertinoIcons.play_circle,
                        color: Colors.teal[700],
                      ),
                      onPressed: () {
                        if (audioPlayer.readingPlaylist!.currentIndex ==
                            index) {
                          if (realtimePLayingInfo.isPlaying) {
                            audioPlayer.stop();
                          } else {
                            audioPlayer.playlistPlayAtIndex(index);
                          }
                        } else {
                          audioPlayer.playlistPlayAtIndex(index);
                        }
                      },
                    );
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${item.nameTranscription}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.teal[700],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${item.nameTranslation}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _setupPlayer() {
    var myList = List<Audio>.generate(listNames.length,
        (i) => Audio('assets/audios/${listNames[i].nameAudio}.mp3'));

    audioPlayer.open(
        Playlist(
          audios: myList,
        ),
        autoStart: false,
        loopMode: LoopMode.none);
  }

  bool _assignPlayValue(index) {
    return audioPlayer.readingPlaylist!.currentIndex == index ? true : false;
  }

  _scrollToIndex(int index) async {
    await _itemScrollController.scrollTo(
        index: index,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOutCubic);
  }
}
