import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AppPlayerState extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayer get getAudioPlayer => _audioPlayer;

  bool _playingState = false;

  bool get getPlayingState => _playingState;

  int _currentTrackItem = -1;

  int get getCurrentTrackItem => _currentTrackItem;

  playTrack({required String nameAudio, required int trackId}) async {
    if (_currentTrackItem != trackId) {
      await _audioPlayer.setAsset('assets/audios/$nameAudio.mp3');
      _currentTrackItem = trackId;
      _audioPlayer.play();
      _playingState = _audioPlayer.playing;
      notifyListeners();
    } else {
      if (_audioPlayer.playing) {
        _currentTrackItem = -1;
        _audioPlayer.stop();
        _playingState = _audioPlayer.playing;
        notifyListeners();
      }
    }
    _audioPlayer.playerStateStream.listen(
      (state) {
        if (state.processingState == ProcessingState.completed) {
          _currentTrackItem = -1;
          _playingState = false;
          notifyListeners();
        }
      },
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
