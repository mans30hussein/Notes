import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_app/presentation/widget/custom_button.dart';
import 'package:hive_app/presentation/widget/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 32.0 , bottom: 32.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Title',
            ),
            SizedBox(height: 16.h,),
            CustomTextField(
              hintText: 'Description',
              maxLines: 5,
            ),
            SizedBox(height: 32.h,),
            CustomButton(),
            SizedBox(height: 16.h,),
          ],
        ),
      ),
    );
  }
}
