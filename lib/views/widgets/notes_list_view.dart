import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';

import 'note_item_widget.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        List<NoteModel> notesList = BlocProvider.of<NotesCubit>(context).notesList ??[];

        return Padding(
          padding:  const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: NoteItem(note: notesList[index]),
            ) ,
            itemCount: notesList.length,
          ),
        );
      },

    );
  }
}