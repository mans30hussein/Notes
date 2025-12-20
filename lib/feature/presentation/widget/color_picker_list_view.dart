import 'package:flutter/material.dart';
import 'package:hive_app/feature/presentation/widget/color_picker.dart';

class ColorPickerListView extends StatelessWidget {
  const ColorPickerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 64,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ColorPicker();
        },
      ),
    );
  }
}