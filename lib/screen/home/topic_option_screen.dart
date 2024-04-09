import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tranquil_mind/common/color_extension.dart';
import 'package:tranquil_mind/screen/bottom_tabview.dart';
import 'package:tranquil_mind/screen/home/home_screen.dart';
import 'package:tranquil_mind/screen/home/reminder_screen.dart';
import 'package:tranquil_mind/screen/startup_screen.dart';

import '../../common_widget/round_button.dart';
import"package:hovering/hovering.dart";


class option_screen extends StatefulWidget {
  const option_screen({Key? key}) : super(key: key);

  @override
  State<option_screen> createState() => _option_screenState();
}

class _option_screenState extends State<option_screen> {
  List topicArr = [
    {
      "image": "assets/images/pic1.png",
      "title": "Stress Relief",
      "color": "#ffeee1",
      "text-color": "#3f414e",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.",
    },

    {
      "image": "assets/images/pic1.png",
      "title": "Stress Relief",
      "color": "#ffeee1",
      "text-color": "#3f414e",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.",
    },

    {
      "image": "assets/images/pic1.png",
      "title": "Stress Relief",
      "color": "#ffeee1",
      "text-color": "#3f414e",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.",
    },

    {
      "image": "assets/images/pic1.png",
      "title": "Stress Relief",
      "color": "#ffeee1",
      "text-color": "#3f414e",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.",
    },

    {
      "image": "assets/images/pic1.png",
      "title": "Stress Relief",
      "color": "#ffeee1",
      "text-color": "#3f414e",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.",
    },

    {
      "image": "assets/images/pic1.png",
      "title": "Stress Relief",
      "color": "#ffeee1",
      "text-color": "#3f414e",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.",
    },
    // Add more topics here
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
      ),
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Discover your path to",
                          style: TextStyle(
                            fontFamily: "Lora",
                            fontStyle: FontStyle.italic,
                            color: Tcolor.primaryText,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Tranquility",
                    style: TextStyle(
                      fontFamily: "Lora",
                      fontStyle: FontStyle.italic,
                      color: Tcolor.primaryText,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Meditations for any mind, any mood, any goal.",
                    style: TextStyle(
                      color: Tcolor.secondaryText,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemCount: topicArr.length,
                itemBuilder: (BuildContext context, int index) {
                  final topic = topicArr[index];
                  return HoverContainer(
                    height: 200, // Adjust height as needed
                    decoration: BoxDecoration(
                      color: HexColor.formHex(topic["color"]),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    hoverDecoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Handle onTap
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(topic: topic),
                          ),
                        );
                      },
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              topic["image"],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              topic["title"],
                              style: TextStyle(
                                color: HexColor.formHex(topic["text-color"]),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          RoundButton(title: "Next", onPressed: () {
            context.push(const reminderScreen());
          }),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> topic;

  const DetailScreen({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic["title"]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(topic["image"]),
            const SizedBox(height: 20),
            Text(
              topic["description"],
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}


