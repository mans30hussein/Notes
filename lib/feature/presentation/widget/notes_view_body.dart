import 'package:flutter/material.dart';
import 'package:hive_app/feature/presentation/widget/custom_appBar.dart';
import 'package:hive_app/feature/presentation/widget/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
            CustomAppBar(
            onPressed: () {},
            title: "Notes",
            icon: Icons.search, 
          ),
         // SizedBox(height: 30.h),
          Flexible(child: const NotesListView()),
        ],
      ),
    );
  }
}
