import 'package:flutter/material.dart';
import 'package:tranquil_mind/common_widget/round_button.dart';
import 'dart:async';

class BreathingScreen extends StatefulWidget {
  @override
  _BreathingScreenState createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(Duration.zero, () {});
    super.initState();
  }

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

  void _startExerciseTimer() {
    _currentSeconds = 0;
    if (_timer != null && _timer.isActive) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentSeconds++;
        if (_currentSeconds >= _getExerciseDuration()) {
          _timer.cancel();
          print("Exercise completed for ${_exercises[_selectedExerciseIndex]}");
        }
      });
    });
  }

  int _getExerciseDuration() {
    switch (_selectedExerciseIndex) {
      case 0:
        return 60; // Duration for Deep Breathing (in seconds)
      case 1:
        return 19; // Duration for 4-7-8 Breathing (in seconds)
      case 2:
        return 32; // Duration for Box Breathing (in seconds)
      default:
        return 0;
    }
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/breathe${_selectedExerciseIndex + 1}.jpg',
            height: 300,
            width: 400,
          ),
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
            child: RoundButton(
              title: "Start Exercise",
              onPressed: _startExerciseTimer,
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
    );
  }
}
