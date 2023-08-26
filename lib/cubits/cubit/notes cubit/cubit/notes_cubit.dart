import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/Models/note_model.dart';

import '../../../../constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchAllNotes() {
    emit(NotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);

      final List<NoteModel> notes = notesBox.values.toList();
      emit(NotesSucess(notes));
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}
