import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_form_field.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import 'edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: ()async
            {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;

              await widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 50),
          CustomTextField(
            hintText: widget.note.title,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: widget.note.subTitle,
            maxLines: 5,
            onChanged: (value)
            {
              content = value;
            },
          ),
          const SizedBox(height: 16),
           EditNoteColorsList(note: widget.note),
        ],
      ),
    );
  }
}


