import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/core/constant.dart';
import 'package:hive_app/feature/data/model/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Future<void> addNote(NoteModel note) async {
    try {
      emit(AddNoteStateLoading());
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteStateSuccess());
    } catch (e) {
      emit(AddNoteStateFailure(e.toString()));
    }
  }
}
