import 'dart:io';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:clipboard/clipboard.dart';
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
  late AssetsAudioPlayer audioPlayer;

  @override
  void initState() {
    audioPlayer = AssetsAudioPlayer();
    Future.delayed(Duration(milliseconds: 500), () {
      if (args?.id! != null) {
        _scrollToIndex(args!.id! - 1);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
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
    _setupPlayer(snapshot);
    return Scrollbar(
      child: ScrollablePositionedList.builder(
        itemScrollController: _itemScrollController,
        itemCount: snapshot.data!.length,
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
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.red,
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
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
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
                Divider(
                  indent: 16,
                  endIndent: 16,
                  color: Colors.red,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    audioPlayer.builderRealtimePlayingInfos(
                      builder: (context, realtimePLayingInfo) {
                        return IconButton(
                          icon: Icon(
                            realtimePLayingInfo.isPlaying &&
                                    _assignPlayValue(item.id! - 1)
                                ? CupertinoIcons.pause_circle
                                : CupertinoIcons.play_circle,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            if (audioPlayer.readingPlaylist!.currentIndex ==
                                item.id! - 1) {
                              if (realtimePLayingInfo.isPlaying) {
                                audioPlayer.pause();
                              } else {
                                audioPlayer.play();
                              }
                            } else {
                              audioPlayer.playlistPlayAtIndex(item.id! - 1);
                            }
                          },
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.doc_on_doc,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        FlutterClipboard.copy(
                          '${item.nameArabic}\n${item.nameTranscription}\n${item.nameTranslation}',
                        );
                        _snackMessage();
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.share,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Share.share(
                          '${item.nameArabic}\n${item.nameTranscription}\n${item.nameTranslation}',
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.image,
                        color: Colors.red,
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
        ],
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
      child: Container(
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: Card(
          margin: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 1,
          shadowColor: Colors.red[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
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
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontFamily: 'Gilroy',
                ),
              ),
              SizedBox(height: 8),
              Text(
                '${item.nameTranslation}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Gilroy',
                ),
              ),
              SizedBox(height: 16),
              Divider(
                indent: 16,
                endIndent: 16,
                color: Colors.black,
              ),
              Text(
                'Имена Аллаха',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Gilroy',
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Image.asset('assets/images/apps.png'),
                      iconSize: 50,
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Image.asset('assets/images/app_icon.png'),
                      iconSize: 35,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _takeScreenshot(NameItem item) async {
    final unit8List =
        await _screenshotController.captureFromWidget(_forScreen(item));
    String tempPath = (Platform.isAndroid
            ? await getExternalStorageDirectory()
            : await getApplicationSupportDirectory())!
        .path;
    File file = File('$tempPath/image_${item.id}.jpg');
    await file.writeAsBytes(unit8List);
    await Share.shareFiles([file.path]);
  }

  _setupPlayer(AsyncSnapshot snapshot) {
    var myList = List<Audio>.generate(snapshot.data!.length,
        (i) => Audio('assets/audios/${snapshot.data[i].nameAudio}.mp3'));

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

  _snackMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
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
  }
}
