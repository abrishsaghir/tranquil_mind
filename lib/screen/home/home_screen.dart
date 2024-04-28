import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../meditation/meditation_screen.dart';
import '../bottom_tabview.dart';


class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List HomeArr = [
    {
      "image": "assets/images/pic1.png",
      "title": "Stress Relief",
      "subtitle": "MEDITATION . 10-20 min",
    },
    {
      "image": "assets/images/pic2.png",
      "title": "Mindfull Breathing",
      "subtitle": "MEDITATION . 3-10 min",
    },
    {
      "image": "assets/images/pic3.png",
      "title": "Guided Meditation",
      "subtitle": "MEDITATION . 10-20 min",
    },
    {
      "image": "assets/images/pic4.png",
      "title": "Increase Happiness",
      "subtitle": "MEDITATION . 3-10 min",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff718e88),),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Image.asset(
          "assets/images/logo.png",
          width: MediaQuery.of(context).size.width * 0.65,
          height: 80,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5,),
                Text("Breath in. Breath out. Let's meditate together",
                  style: TextStyle(
                    color: Tcolor.primaryText,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8,),
                Text("Quiet your mind. Awaken your soul.",
                  style: TextStyle(
                    color: Tcolor.secondaryText,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 25,),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffd3ab9b),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    "assets/images/img1.png",
                                    width: 80, height: 80,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("RELAXATION",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 8,),
                                    Text(
                                      "COURSE",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 11,
                                      ),
                                    ),
                                    const SizedBox(height: 25,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("3-10 min",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            context.push(const MeditationScreen());
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Tcolor.primaryTextW,
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                                            child: Text("START",
                                              style: TextStyle(
                                                color: Tcolor.primaryText,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffa3c0ba),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    "assets/images/img2.png",
                                    width: 80, height: 80,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("FOCUS",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 8,),
                                    Text(
                                      "MUSIC",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 11,
                                      ),
                                    ),
                                    const SizedBox(height: 25,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("3-10 min",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            context.push(const MeditationScreen());
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Tcolor.primaryTextW,
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                                            child: Text("START",
                                              style: TextStyle(
                                                color: Tcolor.primaryText,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: const Color(0xffa1a4b2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset("assets/images/img3.png", width: double.maxFinite, fit: BoxFit.fitWidth,),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Daily Thoughts",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                  Text("Meditation 3-10 min",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                               context.push(const MeditationScreen());
                              },
                              child: Icon(
                                Icons.play_circle_filled,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Text("Recommended for you",
                  style: TextStyle(
                    color: Tcolor.primaryText,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.35 * 0.7 + 45 + 40,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var HomeObj = HomeArr[index];
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              HomeObj["image"],
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: MediaQuery.of(context).size.width * 0.25 * 0.7,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(HomeObj["title"],
                              style: TextStyle(
                                color: Tcolor.primaryText,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(HomeObj["subtitle"],
                              style: TextStyle(
                                color: Tcolor.primaryText,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 20,),
                    itemCount: HomeArr.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
