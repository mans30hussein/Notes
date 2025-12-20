import 'package:flutter/material.dart';
import 'package:hive_app/core/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, this.maxLines , this.onSaved ,  this.onchanged});

  final String hintText;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      onSaved: onSaved,
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'Field is required';
        }
        return null;
      },
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
