import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tranquil_mind/screen/meditation/model/audio.dart';
import 'package:tranquil_mind/screen/meditation/model/audio_provider.dart';
import 'package:tranquil_mind/screen/meditation/audio_page.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  //get the playlist provider
  late final dynamic audioProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioProvider = Provider.of<AudioProvider>(context, listen: false);
  }

  //go to an audio
  void goToAudio (int audioIndex) {
    //update current audio index
    audioProvider.currentAudioIndex = audioIndex;
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AudioPage(),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.white,),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        title: Text(
          "Tranquil Meditation",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),


      body: Consumer<AudioProvider>(
        builder: (context, value, child) {
          //get the playlist
          final List<Audio> audiolist =  value.audiolist;

          //return list view UI
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ListView.builder(
              itemCount: audiolist.length,
              itemBuilder: (context, index) {

                //get individual audio
               final Audio audio = audiolist[index];
                return ListTile(
                  title: Text(audio.audioName),
                  subtitle: Text(audio.artistName),
                  leading: Image.asset(audio.albumImagePath),
                  onTap: () => goToAudio(index),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


