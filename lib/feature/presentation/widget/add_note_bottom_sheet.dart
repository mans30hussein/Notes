import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/feature/data/maneger/add_note/add_note_cubit.dart';
import 'package:hive_app/feature/presentation/widget/notes_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteStateFailure) {
            debugPrint(state.message);
          }
          if (state is AddNoteStateSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteStateLoading ? true : false,
            child: NotesForm());
        },
      ),
    );
  }
}
