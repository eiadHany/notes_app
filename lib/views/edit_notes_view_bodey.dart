import 'package:flutter/material.dart';
import 'package:notes_app/views/weidgets/custom_text_field.dart';

import 'weidgets/custom_app_bar.dart';

class EditNotesViewBody extends StatelessWidget {
  const EditNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
            ),
            SizedBox(
              height: 50,
            ),
            CustomTextField(hint: 'title'),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              hint: 'content',
              maxlines: 5,
            )
          ],
        ),
      ),
    );
  }
}
