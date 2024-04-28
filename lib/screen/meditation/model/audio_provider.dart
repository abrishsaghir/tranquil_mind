import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tranquil_mind/screen/meditation/model/audio.dart';

class AudioProvider extends ChangeNotifier {
  //audio list of meditation
  final List<Audio> audiolist = [
    Audio(
        audioName: "You wil be OK! ",
        artistName: "K.A Emmons",
        albumImagePath: "assets/images/meditation0.jpg",
        audioPath: "audios/audio1.mp3"
    ),
    Audio(
        audioName: "Mindfulness Meditation",
        artistName: "Jenny Art",
        albumImagePath: "assets/images/meditation1.jpg",
        audioPath: "audios/audio2.mp3"
    ),
    Audio(
        audioName: "Calm",
        artistName: "Proko",
        albumImagePath: "assets/images/meditation2.jpg",
        audioPath: "audios/audio3.mp3"
    ),
    Audio(
        audioName: "Ask and You Shall Receive",
        artistName: "Tracy Weinzapel",
        albumImagePath: "assets/images/meditation3.jpg",
        audioPath: "audios/audio4.mp3"
    ),
    Audio(
        audioName: "Positive Change is Coming",
        artistName: "Great Meditation",
        albumImagePath: "assets/images/meditation4.jpg",
        audioPath: "audios/audio5.mp3"
    ),

  ];

  //current audio index playing
  int? currentaudioindex;

  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  //durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor
  AudioProvider() {
    listenToDuration();
  }

  //initially not playing
  bool _isPlaying = false;

  //play the audio
  void play() async {
    try {
      if (currentaudioindex != null) {
        final String path = audiolist[currentaudioindex!].audioPath;
        await _audioPlayer.stop();
        await _audioPlayer.play(AssetSource(path));
        _isPlaying = true;
        notifyListeners();
      } else {
        print('No audio index specified.');
      }
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  //pause current audio
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    }
    else {
      resume();
    }
    notifyListeners();
  }

  //seek to a specific position in the current audio
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //play next audio
  void playNextAudio() {
    if (currentaudioindex != null) {
      if (currentaudioindex! < audiolist.length - 1) {
        currentAudioIndex = currentaudioindex! + 1;
      }
      else {
        currentAudioIndex = 0;
      }
    }
  }

  //play previous audio
  void playPreviousAudio() async {
    //if more than 2 seconds have passed, restart the current audio
    if (_currentDuration.inSeconds > 2) {

    }
    //if it is within first 2 second of the audio, go to previous audio
    else {
      if (currentaudioindex! > 0) {
        currentAudioIndex = currentaudioindex! - 1;
      }
      else {
        //if it is first audio loop back to last audio
        currentAudioIndex = audiolist.length - 1;
      }
    }
  }

  //listen to duration
  void listenToDuration() {
    //listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    //listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    //listen for audio completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextAudio();
    });
  }

  //dispose audio player

  //getters
  List<Audio> get AudioList => audiolist;
  int? get CurrentAudioIndex => currentaudioindex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  //setters
  set currentAudioIndex(int? newIndex) {
    //update current audio index
    currentaudioindex = newIndex;
    if(newIndex != null) {
      play();
    }
    //update UI
    notifyListeners();
  }
}
