import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/feature/data/maneger/display_note/note_cubit.dart';
import 'package:hive_app/feature/data/model/note_model.dart';
import 'package:hive_app/feature/presentation/widget/note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<NoteModel> notes = BlocProvider.of<NoteCubit>(context).notes;
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: NoteItem(note: notes[index]),
              );
            },
          ),
        );
      },
    );
  }
}
