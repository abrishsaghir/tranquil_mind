import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tranquil_mind/common_widget/audio_page_box_design.dart';
import 'package:tranquil_mind/screen/meditation/meditation_screen.dart';
import 'package:tranquil_mind/screen/meditation/model/audio_provider.dart';

class AudioPage extends StatelessWidget {
  const AudioPage({super.key});

  //covert duration into min:sec
  String formatTime (Duration duration) {
    String twoDigitSeconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioProvider>(
        builder:(context, value, child) {
          //get audioList
          final audiolist = value.audiolist;

          //get current audio index
          final currentAudio = audiolist[value.CurrentAudioIndex ?? 0];
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //app bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //back button
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Color(0xff718e88),),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),

                        //title
                        const Text("M E D I T A T I O N"),

                        //menu button
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.star),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),

                    //album picture
                    NeuBox(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(currentAudio.albumImagePath),
                          ),

                          //audio, artist name & icon
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //audio and artist name
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentAudio.audioName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(currentAudio.artistName),
                                  ],
                                ),

                                //heart icon
                                const Icon(
                                    Icons.favorite,
                                    color: Colors.red),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15,),

                    //audio duration progress
                    Column(
                      children: [
                         Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(formatTime(value.currentDuration)), //start
                              Icon(Icons.shuffle),  // shuffle icon
                              Icon(Icons.repeat),
                              Text(formatTime(value.totalDuration)),
                            ],
                          ),
                        ),

                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
                          ),
                          child: Slider(
                            min: 0,
                            max: value.totalDuration.inSeconds.toDouble(),
                            value: value.currentDuration.inSeconds.toDouble(),
                            activeColor: Colors.blueGrey,
                            onChanged: (double double) {
                            },
                            onChangeEnd: (double double) {
                              value.seek(Duration(seconds: double.toInt()));
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),
                    //playback controls
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => value.playPreviousAudio(),
                            child: const NeuBox(
                              child: Icon(Icons.skip_previous),
                            ),
                          ),
                        ),
                        const SizedBox(width: 25,),

                        //PLAY PAUSE BUTTON
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () =>  value.pauseOrResume(),
                            child: NeuBox(
                              child: Icon(value.isPlaying ? Icons.pause: Icons.play_arrow),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),

                        //skip forward
                        Expanded(
                          child: GestureDetector(
                            onTap: () => value.playNextAudio(),
                            child: NeuBox(
                              child: Icon(Icons.skip_next),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        );

  }
}
