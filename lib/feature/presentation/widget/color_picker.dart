import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: const CircleAvatar(
        radius: 32,
        
        backgroundColor: Colors.blue,
      ),
    );
  }
}