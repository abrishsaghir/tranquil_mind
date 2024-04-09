import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tranquil_mind/common/color_extension.dart';

class TabButton extends StatelessWidget {
  final IconData iconData;
  final String title;
  final bool isSelect;
  final VoidCallback onPressed;

  const TabButton({
    required this.iconData,
    required this.title,
    required this.isSelect,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isSelect ? Tcolor.primary : Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.center,
             child: Icon(
              iconData,
              size: 22,
              color: isSelect ? Colors.white : Tcolor.primary,
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: isSelect ? Colors.white : Color(0xff718e88),
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
