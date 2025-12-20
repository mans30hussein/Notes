import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_app/feature/data/model/note_model.dart';
import 'package:hive_app/feature/presentation/widget/custom_appBar.dart';
import 'package:hive_app/feature/presentation/widget/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
 final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
    String? title , content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        children: [
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.description = content ?? widget.note.description;
              widget.note.save();
              Navigator.pop(context);
              
            },
            title: "Edit Note",
            icon: Icons.check,
          ),
          SizedBox(
            height: 40.h,
          ),
          CustomTextField(
            onchanged: (value){
              title = value;
            },
            hintText: widget.note.title,
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomTextField(
            onchanged: (value){
              content = value;
            },
            hintText: widget.note.description,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
