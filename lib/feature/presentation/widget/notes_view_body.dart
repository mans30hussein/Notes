import 'package:flutter/material.dart';
import 'package:hive_app/core/constant.dart';
import 'package:hive_app/feature/presentation/widget/custom_appBar.dart';
import 'package:hive_app/feature/presentation/widget/note_item.dart';
import 'package:hive_app/feature/presentation/widget/notes_list_view.dart';
import 'package:hive/hive.dart';
import 'package:hive_app/feature/data/model/note_model.dart';
class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
            CustomAppBar(
            onPressed: () {
              showSearch(
                context: context,
                delegate: NotesSearchDelegate(),
              );
            },
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



class NotesSearchDelegate extends SearchDelegate {
  final Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);

  @override
  String? get searchFieldLabel => 'Search notes...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchList();
  }

  Widget _buildSearchList() {
    final results = notesBox.values.where((note) {
      return note.title.toLowerCase().contains(query.toLowerCase()) ||
          note.description.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (results.isEmpty) {
      return const Center(child: Text('No results found'));
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final note = results[index];
        return NoteItem(note: note);
      },
    );
  }
}
