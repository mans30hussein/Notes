import 'package:flutter/material.dart';
import 'package:hive_app/feature/presentation/widget/add_note_bottom_sheet.dart';
import 'package:hive_app/feature/presentation/widget/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyan,
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
                context: context,
                builder: (context) {
                  return AddNoteBottomSheet();
                });
          },
          child: const Icon(Icons.add),
        ),
        body: NotesViewBody(),
      ),
    );
  }
}
