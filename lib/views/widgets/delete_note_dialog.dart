import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit.dart';
import 'package:notes_app/helper.dart';
import 'package:notes_app/models/note_model.dart';

class DeleteNoteDialog extends StatelessWidget {
  const DeleteNoteDialog({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete Note"),
      content: const Text("Are you sure you want to delete this note?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            note.delete();
            showSnackBar(
              context,
              'Note deleted successfully.',
              color: Colors.red,
            );
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.of(context).pop();
          },
          child: const Text("Delete"),
        ),
      ],
    );
  }
}
