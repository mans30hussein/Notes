import 'package:flutter/material.dart';
import 'package:hive_app/presentation/widget/notes_view_body.dart';

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
                context: context,
                builder: (context) {
                  return Container();
                });
          },
          child: const Icon(Icons.add),
        ),
        body: NotesViewBody(),
      ),
    );
  }
}
class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container();
  }
}
