import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_app/feature/data/maneger/add_note_cubit.dart';
import 'package:hive_app/feature/data/model/note_model.dart';
import 'package:hive_app/feature/presentation/widget/custom_button.dart';
import 'package:hive_app/feature/presentation/widget/custom_text_field.dart';

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
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding:
            const EdgeInsets.only(right: 16, left: 16, top: 32.0, bottom: 32.0),
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
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    NoteModel addNote = NoteModel(
                      date: DateTime.now().toString(),
                      title: title!,
                      description: description!,
                      color: Colors.red.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(
                     addNote
                    );
                    debugPrint(addNote.toString());
                    
                  }else{
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
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
