
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';

import '../../constants/constants.dart';
import '../../models/note_model.dart';


class AddNoteCubit extends Cubit<AddNoteStates>{
  AddNoteCubit():super(AddNoteInitialState());

  Color color = const Color(0xffAC3931);
  addNote(NoteModel note)async
  {
    note.color = color.value;
    emit(AddNoteLoadingState());

   var notesBox =  Hive.box<NoteModel>(kNotesBox);

   await notesBox.add(note).then((value) {

     emit(AddNoteSuccessState());
   })
       .catchError((error)
   {

     emit(AddNoteFailureState(errMessage: error.toString()));
   });

  }

}