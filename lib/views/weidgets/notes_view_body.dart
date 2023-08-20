import 'package:flutter/material.dart';
import 'package:notes_app/views/weidgets/custom_app_bar.dart';

import 'custom_note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          CustomAppBar(),
          NoteItem(),
        ],
      ),
    );
  }
}
