import 'package:flutter/material.dart';
import 'package:tranquil_mind/common/color_extension.dart';
import 'package:tranquil_mind/screen/startup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tranquil Mind',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Lora",
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme( elevation: 0, backgroundColor: Colors.transparent),
        colorScheme: ColorScheme.fromSeed(seedColor: Tcolor.primary),
        useMaterial3: false,
      ),
      home: const StartupScreen(),
    );
  }
}

