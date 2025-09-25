import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.selected, required this.color});
  final bool selected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return selected
        ? CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 32,
            backgroundColor: color,
          );
  }
}
