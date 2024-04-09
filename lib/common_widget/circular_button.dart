import 'package:flutter/material.dart';
import 'package:tranquil_mind/common/color_extension.dart';

class circularButton extends StatelessWidget {
  final String title;
  final bool isSelect;
  final VoidCallback onPressed;
  const circularButton({super.key, required this.title, required this.isSelect, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelect ? Tcolor.primaryText : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Tcolor.secondaryText, width: 1)
        ),
        alignment: Alignment.center,
        child: Text(
          title, style: TextStyle(
          color: isSelect ? Colors.white :  Tcolor.primaryText,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        ),
      ),
    );
  }
}

