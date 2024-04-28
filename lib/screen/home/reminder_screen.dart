import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tranquil_mind/common/color_extension.dart';
import 'package:tranquil_mind/common_widget/circular_button.dart';
import 'package:tranquil_mind/common_widget/round_button.dart';
import 'package:tranquil_mind/screen/bottom_tabview.dart';
import 'package:tranquil_mind/screen/home/home_screen.dart';

class reminderScreen extends StatefulWidget {
  const reminderScreen({super.key});

  @override
  State<reminderScreen> createState() => _reminderScreenState();
}

class _reminderScreenState extends State<reminderScreen> {
  List dayArr = [
    {"name":"SU", "is_select": false},
    {"name":"MO", "is_select": false},
    {"name":"TU", "is_select": false},
    {"name":"WE", "is_select": false},
    {"name":"TH", "is_select": false},
    {"name":"FR", "is_select": false},
    {"name":"SA", "is_select": false},
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
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                constraints: BoxConstraints(minHeight: context.height - 180),
                padding:  const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15,),
                    Text("What time would you like to meditate?",
                    style: TextStyle(
                      color: Tcolor.primaryText,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),),

                    const SizedBox(height: 15,),
                    Text("We recommend you first thing in\nthe morning.",
                      style: TextStyle(
                        color: Tcolor.secondaryText,
                        fontSize: 18,
                      ),),

                    const SizedBox(height: 35,),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: const Color(0xfff5f5f9),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        onDateTimeChanged: (DateTime newData) {},
                        use24hFormat: false,
                        minuteInterval: 1,
                      ),
                    ),

                    const SizedBox(height: 35,),
                    Text("What day would you like to meditate ",
                      style: TextStyle(
                        color: Tcolor.primaryText,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),),

                    const SizedBox(height: 15,),
                    Text("Everyday is best, but we recommend picking at least five",
                      style: TextStyle(
                        color: Tcolor.secondaryText,
                        fontSize: 18,
                      ),),

                    const SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: dayArr.map((dObj) {
                        return circularButton(
                          title: dObj["name"],
                          isSelect: dObj["is_select"],
                          onPressed: () {
                            setState(() {
                              dayArr[dayArr.indexOf(dObj)]["is_select"] = !(dObj["is_select"] as bool? ?? false);
                            });
                          });
                      }).toList(),
                    ),

                    const SizedBox(height: 25,),
                    RoundButton(title: "Save", onPressed: () {
                      context.push(const BottomTabView());
                    }),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: () {
                          context.push(const BottomTabView());
                        }, child: Text(
                          "No Thanks!" ,
                          style: TextStyle(
                            color: Tcolor.primaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
