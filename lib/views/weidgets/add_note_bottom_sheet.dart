import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:notes_app/Models/note_model.dart';
import 'package:notes_app/cubits/cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/cubit/cubit/cubit/notes_cubit.dart';

import 'custom_button.dart';
import 'custom_color_list_view.dart';
import 'custom_text_field.dart';

class AddNoteModelSheet extends StatelessWidget {
  const AddNoteModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: EdgeInsets.only(
            right: 16,
            left: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailure) {}
            {
              if (state is AddNoteSucess) {
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              }
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
                child: AbsorbPointer(
                    absorbing: state is AddNoteLoading ? true : false,
                    child: const AddNoteForm()));
          },
        ),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidatemMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidatemMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hint: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: 'Content',
            maxlines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formatDate(),
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidatemMode = AutovalidateMode.always;
                  }
                  setState(() {});
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  String formatDate() {
    var currentDate = DateTime.now();
    var formattedDateCurrent = DateFormat.yMd().format(currentDate);
    return formattedDateCurrent;
  }
}
