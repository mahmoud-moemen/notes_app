

import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'note_item_widget.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(

        children:
        [
          SizedBox(height: 50),
          CustomAppBar(),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}



