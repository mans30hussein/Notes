import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/core/constant.dart';
import 'package:hive_app/feature/data/model/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color =  Colors.blue;
  

  Future<void> addNote(NoteModel note) async {
    // ignore: deprecated_member_use
    note.color = color.value;
    try {
      emit(AddNoteStateLoading());
      Box<NoteModel> noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);

      emit(AddNoteStateSuccess());
    } catch (e) {
      emit(AddNoteStateFailure(e.toString()));
    }
  }
}
