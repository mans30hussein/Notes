part of 'add_note_cubit.dart';
class AddNoteState {}
class AddNoteInitial extends AddNoteState {}
class AddNoteStateLoading extends AddNoteState {}
class AddNoteStateSuccess extends AddNoteState {}
class AddNoteStateFailure extends AddNoteState {
  final String message;
  AddNoteStateFailure(this.message);
}