import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/feature/data/maneger/add_note/add_note_cubit.dart';
import 'package:hive_app/feature/presentation/widget/color_picker.dart';

class ColorPickerListView extends StatefulWidget {
  const ColorPickerListView({super.key});

  @override
  State<ColorPickerListView> createState() => _ColorPickerListViewState();
}

class _ColorPickerListViewState extends State<ColorPickerListView> {
  int selectedIndex = 0;
  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.grey,
    Colors.black,
  ];

  List<Color> color2 = [
    Color(0xffef476f),
    Color(0xffffd166),
    Color(0xff06d6a0),
    Color(0xff118ab2),
    Color(0xff073b4c),

  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              BlocProvider.of<AddNoteCubit>(context).color = colors[index];
              setState(() {});
            },
            child: ColorPicker(
              color: colors[index],
              isSelected: index == selectedIndex,
            ),
          );
        },
      ),
    );
  }
}
