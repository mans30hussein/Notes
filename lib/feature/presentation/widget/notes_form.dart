import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_app/feature/data/maneger/add_note/add_note_cubit.dart';
import 'package:hive_app/feature/data/model/note_model.dart';
import 'package:hive_app/feature/presentation/widget/color_picker_list_view.dart';
import 'package:hive_app/feature/presentation/widget/custom_button.dart';
import 'package:hive_app/feature/presentation/widget/custom_text_field.dart';
import 'package:intl/intl.dart';

class NotesForm extends StatefulWidget {
  const NotesForm({super.key});

  @override
  State<NotesForm> createState() => _NotesFormState();
}

class _NotesFormState extends State<NotesForm> {
  final _formKey = GlobalKey<FormState>();

  String? _title;
  String? _description;
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  int _selectedColor = Colors.yellow.value;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidate,
      child: Padding(
        padding: EdgeInsets.only(
          right: 16,
          left: 16,
          top: 32,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTitleField(),
              SizedBox(height: 16.h),
              _buildDescriptionField(),
              SizedBox(height: 22.h),
              ColorPickerListView(
               
              ),
              SizedBox(height: 24.h),
              _buildAddButton(),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleField() {
    return CustomTextField(
      hintText: 'Title',
      onSaved: (value) => _title = value,
    );
  }

  Widget _buildDescriptionField() {
    return CustomTextField(
      hintText: 'Description',
      maxLines: 5,
      onSaved: (value) => _description = value,
    );
  }

  Widget _buildAddButton() {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        if (state is AddNoteStateLoading) {
          return const SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(color: Colors.black),
          );
        }

        return CustomButton(
          onPressed: _submitForm,
        );
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final note = NoteModel(
        title: _title!,
        description: _description!,
        date: _formattedDate(),
        color: BlocProvider.of<AddNoteCubit>(context).color.value,
      );

      context.read<AddNoteCubit>().addNote(note);
    } else {
      setState(() {
        _autoValidate = AutovalidateMode.always;
      });
    }
  }

  String _formattedDate() {
    return DateFormat('dd-MM-yyyy').format(DateTime.now());
  }
}
