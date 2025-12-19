import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_app/feature/data/model/note_model.dart';
import 'package:hive_app/feature/presentation/view/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => EditNoteView(),));
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 20.w,
          top: 20.h,
          bottom: 20.h,
        ),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                note.title,
                style: TextStyle(fontSize: 28.sp, color: Colors.black),
              ),
      
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                    note.description,
                  style: TextStyle(
                      fontSize: 18.sp, color: Colors.black.withOpacity(0.4)),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 24.sp,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                note.date,
                style: TextStyle(
                    fontSize: 16.sp, color: Colors.black.withOpacity(0.4)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
