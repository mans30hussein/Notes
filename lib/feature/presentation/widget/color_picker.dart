import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key, required this.isSelected, required this.color});
  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isSelected ? Padding(
      padding: const EdgeInsets.all(2.0),
      child: CircleAvatar(
        radius: 34,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 28,
        
          
          backgroundColor: color,
        ),
      )
    ) : Padding(
      padding: const EdgeInsets.all(2.0),
      child: CircleAvatar(
        radius: 34,
        
        backgroundColor: color,
      ),
    );
  }
}