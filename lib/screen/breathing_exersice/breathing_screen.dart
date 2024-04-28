import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BreathingScreen extends StatefulWidget {
  @override
  _BreathingScreenState createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen> {
  late VideoPlayerController _videoController1;
  late VideoPlayerController _videoController2;
  late VideoPlayerController _videoController3;
  late Timer _timer;

  int _selectedExerciseIndex = 0;
  List<String> _exercises = [
    "Deep Breathing",
    "4-7-8 Breathing",
    "Box Breathing"
  ];
  List<String> _exerciseDescriptions = [
    "Inhale deeply through your nose, hold your breath for a few seconds, then exhale slowly through your mouth.",
    "Inhale deeply for 4 seconds, hold your breath for 7 seconds, and exhale slowly for 8 seconds.",
    "Inhale for a count of 4, hold for a count of 4, exhale for a count of 4, and hold for a count of 4 before starting again."
  ];
  int _currentSeconds = 0;

  @override
  void initState() {
    super.initState();
    _initializeVideoControllers();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // Initialization logic here if needed
    });
  }

  Future<void> _initializeVideoControllers() async {
    _videoController1 = VideoPlayerController.asset('assets/videos/video1.mp4');
    _videoController2 = VideoPlayerController.asset('assets/videos/video2.mp4');
    _videoController3 = VideoPlayerController.asset('assets/videos/video3.mp4');

    await Future.wait([
      _videoController1.initialize(),
      _videoController2.initialize(),
      _videoController3.initialize(),
    ]);

    setState(() {});
  }

  @override
  void dispose() {
    _videoController1.dispose();
    _videoController2.dispose();
    _videoController3.dispose();
    _timer.cancel(); // Cancel the timer when disposing the widget
    super.dispose();
  }

  void _startExerciseTimer() {
    _currentSeconds = 0;
    if (_timer.isActive) {
      _timer.cancel(); // Cancel the timer if it's already active
    }

    switch (_selectedExerciseIndex) {
      case 0:
        _videoController1.play();
        break;
      case 1:
        _videoController2.play();
        break;
      case 2:
        _videoController3.play();
        break;
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentSeconds++;
        if (_currentSeconds >= _getExerciseDuration()) {
          _timer.cancel();
          print("Exercise completed for ${_exercises[_selectedExerciseIndex]}");
          _videoController1.pause();
          _videoController2.pause();
          _videoController3.pause();
        }
      });
    });
  }

  int _getExerciseDuration() {
    switch (_selectedExerciseIndex) {
      case 0:
        return 29;
      case 1:
        return 40;
      case 2:
        return 33;
      default:
        return 0;
    }
  }

  Widget _buildVideoPlayer() {
    switch (_selectedExerciseIndex) {
      case 0:
        return AspectRatio(
          aspectRatio: _videoController1.value.aspectRatio,
          child: VideoPlayer(_videoController1),
        );
      case 1:
        return AspectRatio(
          aspectRatio: _videoController2.value.aspectRatio,
          child: VideoPlayer(_videoController2),
        );
      case 2:
        return AspectRatio(
          aspectRatio: _videoController3.value.aspectRatio,
          child: VideoPlayer(_videoController3),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa3c0ba),
        elevation: 0,
        title: Text(
          "Tranquil Breathe",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildVideoPlayer(),
            SizedBox(height: 20),
            Text(
              _exercises[_selectedExerciseIndex],
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _exerciseDescriptions[_selectedExerciseIndex],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ElevatedButton(
                onPressed: _startExerciseTimer,
                child: Text("Start Exercise"),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                _exercises.length,
                    (index) => InkWell(
                  onTap: () {
                    setState(() {
                      _selectedExerciseIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: _selectedExerciseIndex == index
                          ? Color(0xffd3ab9b)
                          : Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _exercises[index],
                      style: TextStyle(
                        color: _selectedExerciseIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Timer: ${_currentSeconds ~/ 60}:${(_currentSeconds % 60).toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

