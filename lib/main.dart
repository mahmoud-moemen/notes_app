import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/bloc_observer.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/views/notes_view.dart';

import 'cubits/notes_cubit/notes_cubit.dart';
import 'models/note_model.dart';

void main() async{

  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context) => AddNoteCubit()),
        BlocProvider(create: (context) => NotesCubit()..fetchAllNotes()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const NotesView(),
      ),
    );
  }
}
