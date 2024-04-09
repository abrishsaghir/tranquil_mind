import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tranquil_mind/common/color_extension.dart';
import 'package:tranquil_mind/common_widget/round_button.dart';
import 'package:tranquil_mind/screen/home/reminder_screen.dart';
import 'home/topic_option_screen.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xffEBFAF9),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset( "assets/images/startup_img.png",
              width: double.maxFinite,
              fit: BoxFit.fitWidth,),
          ),
          const Spacer(),
          Text(
              "Welcome to Tranquil Moments!",
            textAlign: TextAlign.center,
              style: TextStyle(
                color: Tcolor.primaryText,
                fontSize: 35,
                fontWeight: FontWeight.w800,
              ),
            ),
          const SizedBox(height: 15,),

          Text(
          "Begin your journey to inner peace and mindfulness with us. "
              "A few minutes could change your whole day",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Tcolor.secondaryText,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),

          const Spacer(),

          RoundButton(title: "LET'S BEGIN", onPressed: (){
            context.push(const option_screen());
            //context.push(const reminderScreen());

          }),
          const Spacer(),
        ],
      ),
    );
  }
}
