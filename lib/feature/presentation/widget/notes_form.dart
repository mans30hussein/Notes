import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_app/feature/data/maneger/add_note/add_note_cubit.dart';
import 'package:hive_app/feature/data/model/note_model.dart';
import 'package:hive_app/feature/presentation/widget/custom_button.dart';
import 'package:hive_app/feature/presentation/widget/custom_text_field.dart';
import 'package:intl/intl.dart';

class NotesForm extends StatefulWidget {
  const NotesForm({
    super.key,
  });

  @override
  State<NotesForm> createState() => _NotesFormState();
}

class _NotesFormState extends State<NotesForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? title;
  String? description;
  DateTime da = DateTime.now();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.only(
            right: 16,
            left: 16,
            top: 32.0,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Title',
                onSaved: (value) {
                  title = value;
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                hintText: 'Description',
                maxLines: 5,
                onSaved: (value) {
                  description = value;
                },
              ),
              SizedBox(
                height: 32.h,
              ),
              BlocBuilder<AddNoteCubit, AddNoteState>(
                builder: (context, state) {
                  return state is AddNoteStateLoading
                      ? SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              DateTime now = DateTime.now();

// Create a DateFormat object with the desired pattern
                              DateFormat formatter =
                                  DateFormat('dd-MM-yyyy');

// Format the DateTime object into a string
                              String formattedDate = formatter.format(now);
                              formKey.currentState!.save();
                              NoteModel addNote = NoteModel(
                                date: formattedDate,
                                title: title!,
                                description: description!,
                                color: Colors.red.value,
                              );
                              BlocProvider.of<AddNoteCubit>(context)
                                  .addNote(addNote);
                              debugPrint(addNote.toString());
                            } else {
                              autovalidateMode = AutovalidateMode.always;
                              setState(() {});
                            }
                          },
                        );
                },
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
