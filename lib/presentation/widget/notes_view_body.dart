import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_app/presentation/widget/custom_appBar.dart';
import 'package:hive_app/presentation/widget/note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const CustomAppBar(),
          SizedBox(height: 30.h),
          NoteItem(),
        ],
      ),
    );
  }
}
