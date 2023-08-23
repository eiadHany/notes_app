import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}
