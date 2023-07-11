
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';

import '../../constants/constants.dart';
import '../../models/note_model.dart';

class NotesCubit extends Cubit<NotesStates>{
  NotesCubit():super( NotesInitialState());

  List<NoteModel>? notesList;
  fetchAllNotes()
  {
      notesList = [];
      var notesBox =  Hive.box<NoteModel>(kNotesBox);
      notesList =  notesBox.values.toList();
      emit(FetchNotesSuccessState());
  }
  
}