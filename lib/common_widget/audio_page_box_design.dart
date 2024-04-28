import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;

  const NeuBox({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          //darker shadow on bottom right
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: const Offset(4, 4), // changes position of shadow
          ),

          //lighter shadow on top left
          BoxShadow(
            color: Colors.white,
            blurRadius: 5,
            offset: const Offset(-4, -4), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}
