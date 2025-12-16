import 'package:flutter/material.dart';
import 'package:hive_app/core/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, this.maxLines});

  final String hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
        border: buildBorder(),
        hintText: hintText,
        
        hintStyle: TextStyle(color: kPrimaryColor)
      ),
    );
  }

  OutlineInputBorder buildBorder([Color? color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        borderSide: BorderSide(
          color: color ?? Colors.white,
          width: 2,
        ));
  }
}
