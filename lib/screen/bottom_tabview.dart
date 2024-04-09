import 'package:flutter/material.dart';
import 'package:tranquil_mind/common/color_extension.dart';
import 'package:tranquil_mind/screen/home/home_screen.dart';
import 'package:tranquil_mind/screen/inspirational_quotes/quotes_screen.dart';
import '../common_widget/tab_buttons.dart';
import 'breathing_exersice/breathing_screen.dart';

class BottomTabView extends StatefulWidget {
  const BottomTabView({Key? key}) : super(key: key);

  @override
  State<BottomTabView> createState() => _BottomTabViewState();
}

class _BottomTabViewState extends State<BottomTabView> with SingleTickerProviderStateMixin {
  late TabController controller;
  int selectTab = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller.addListener(() {
      setState(() {
        selectTab = controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [
          homeScreen(),
          BreathingScreen(),
          Container(color: Colors.yellow,),
          QuotesScreen(),
          Container(color: Colors.red,)
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 15, bottom: 8),
        decoration: const BoxDecoration(
          color: Color(0xffa3c0ba),
          boxShadow: [
            BoxShadow(color: Color(0xffa3c0ba), blurRadius: 4, offset: Offset(0, -4)),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                iconData: Icons.home,
                title: "Home",
                isSelect: selectTab == 0,
                onPressed: () {
                  changeTab(0);
                },
              ),
              TabButton(
                iconData: Icons.air,
                title: "Breathe",
                isSelect: selectTab == 1,
                onPressed: () {
                  changeTab(1);
                },
              ),
              TabButton(
                iconData: Icons.self_improvement,
                title: "Meditate",
                isSelect: selectTab == 2,
                onPressed: () {
                  changeTab(2);
                },
              ),
              TabButton(
                iconData: Icons.format_quote_sharp,
                title: "Quotes",
                isSelect: selectTab == 3,
                onPressed: () {
                  changeTab(3);
                },
              ),
              TabButton(
                iconData: Icons.person,
                title: "Profile",
                isSelect: selectTab == 4,
                onPressed: () {
                  changeTab(4);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeTab(int index) {
    selectTab = index;
    controller.animateTo(index);
    setState(() {});
  }
}
