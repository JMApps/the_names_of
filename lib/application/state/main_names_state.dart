import 'dart:io';
import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_names_of/domain/models/name_model.dart';
import 'package:the_names_of/presentation/widgets/name_screen_widget.dart';

class MainNamesState extends ChangeNotifier {
  final ItemScrollController _itemScrollController = ItemScrollController();

  ItemScrollController get getItemScrollController => _itemScrollController;

  final ScreenshotController _screenshotController = ScreenshotController();

  final Random random = Random();

  bool _isFlipCard = true;


  bool get getIsFlipCard => _isFlipCard;

  toDefaultItem() {
    if (_itemScrollController.isAttached) {
      _itemScrollController.scrollTo(
        index: random.nextInt(99),
        duration: const Duration(
          milliseconds: 750,
        ),
      );
    }
  }

  toIdItem(int id) {
    if (_itemScrollController.isAttached) {
      _itemScrollController.scrollTo(
        index: id,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutSine,
      );
    }
  }

  set copyContent(String content) {
    FlutterClipboard.copy(content);
  }

  set shareContent(String content) {
    Share.share(content, sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2));
  }

  Future<void> takeScreenshot(NameModel model) async {
    final unit8List = await _screenshotController.captureFromWidget(
      NameScreenWidget(model: model),
      delay: const Duration(milliseconds: 50),
    );
    Directory? tempPath = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    File picture = File('${tempPath!.path}/name_${model.id}.jpg');

    ByteData data = await rootBundle.load(join('assets/audios', 'audio_${model.id}.mp3'));
    List<int> audioBytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    String audioPath = join(tempPath.path, 'audio_${model.id}.mp3');

    await picture.writeAsBytes(unit8List);
    await File(audioPath).writeAsBytes(audioBytes, flush: true);

    XFile xPicture = XFile(picture.path);
    XFile xAudio = XFile(audioPath);

    await Share.shareXFiles(
      [xPicture, xAudio],
      sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2),
    );
  }

  changeFlipCard() {
    _isFlipCard = !_isFlipCard;
    notifyListeners();
  }
}
