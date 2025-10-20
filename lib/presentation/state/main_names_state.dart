import 'dart:io';
import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/strings/app_constraints.dart';
import '../../domain/entities/name_entity.dart';
import '../../presentation/widgets/name_screen_widget.dart';

class MainNamesState extends ChangeNotifier {

  final Box _contentSettingsBox = Hive.box(AppConstraints.keyAppSettingsBox);

  MainNamesState() {
    _pageMode = _contentSettingsBox.get(AppConstraints.keyNamesPageMode, defaultValue: false);
  }

  final ItemScrollController _itemScrollController = ItemScrollController();

  ItemScrollController get itemScrollController => _itemScrollController;

  final PageController _pageController = PageController();

  PageController get pageController => _pageController;

  int _namePage = 0;


  int get namePage => _namePage;

  set namePage(int value) {
    _namePage = value;
    notifyListeners();
  }

  final ScreenshotController _screenshotController = ScreenshotController();

  final Random _randomValue = Random();

  bool _isFlipCard = true;

  bool get isFlipCard => _isFlipCard;

  void toListDefaultItem() {
    if (_itemScrollController.isAttached) {
      _itemScrollController.scrollTo(
        index: _randomValue.nextInt(99),
        duration: const Duration(
          milliseconds: 750,
        ),
      );
    }
  }

  void toPageDefaultItem() {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        _randomValue.nextInt(99),
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.slowMiddle,
      );
    }
  }

  set copyContent(String content) {
    FlutterClipboard.copy(content);
  }

  set shareContent(String content) {
    SharePlus.instance.share(
      ShareParams(
        text: content,
        sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2),
      ),
    );
  }

  Future<void> takeScreenshot(NameEntity model) async {
    final unit8List = await _screenshotController.captureFromWidget(
      NameScreenWidget(model: model),
      delay: const Duration(milliseconds: 50),
    );

    Directory? tempPath = Platform.isAndroid ? await getExternalStorageDirectory() : await getApplicationDocumentsDirectory();

    File picture = File('${tempPath!.path}/name_${model.id}.jpg');

    ByteData data = await rootBundle.load(join('assets/audios', 'name${model.id}.mp3'));
    List<int> audioBytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    String audioPath = join(tempPath.path, 'name${model.id}.mp3');

    await picture.writeAsBytes(unit8List);
    await File(audioPath).writeAsBytes(audioBytes, flush: true);

    XFile xPicture = XFile(picture.path);
    XFile xAudio = XFile(audioPath);

    await SharePlus.instance.share(
      ShareParams(
        files: [xPicture, xAudio],
        sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2),
      )
    );
  }

  void get changeFlipCard {
    _isFlipCard = !_isFlipCard;
    notifyListeners();
  }

  bool _pageMode = false;

  bool get pageMode => _pageMode;

  void get changePageMode {
    _pageMode = !_pageMode;
    _contentSettingsBox.put(AppConstraints.keyNamesPageMode, _pageMode);
    notifyListeners();
  }
}
