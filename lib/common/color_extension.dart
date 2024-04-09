import 'package:flutter/material.dart';

class Tcolor {
  static Color get primary => const Color(0xff718e88);
  static Color get secondary => const Color(0xffa3c0ba);
  static Color get tertiary => const Color(0xffd3ab9b);

  static Color get primaryText => const Color(0xff3f414e);
  static Color get primaryTextW => const Color(0xfff6f1fb);
  static Color get secondaryText => const Color(0xffa1a4b2);
  static Color get txtBG => const Color(0xfff2f3f7);

}

extension AppContext on BuildContext {
  Size get size => MediaQuery.sizeOf(this);
  double get width => size.width;
  double get height => size.height;

  Future push (Widget widget) async {
    return Navigator.push(this, MaterialPageRoute(builder: (context) => widget));
  }

  void pop() async {
    return Navigator.pop(this);
  }
}

extension HexColor on Color {
  static Color formHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7)
      buffer.write('ff');
    buffer.write(hexString.replaceFirst("#", ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}