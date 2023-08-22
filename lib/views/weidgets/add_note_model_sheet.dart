import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class AddNoteModelSheet extends StatelessWidget {
  const AddNoteModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextField(),
      ],
    );
  }
}
