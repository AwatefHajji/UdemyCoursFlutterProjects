import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/edit_colors_listview.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              CustomAppBar(
                title: 'Edit Note',
                icon: Icons.check,
                onPressed: () {
                  widget.note.title = _titleController.text.isNotEmpty
                      ? _titleController.text
                      : widget.note.title;
                  widget.note.subtitle = _contentController.text.isNotEmpty
                      ? _contentController.text
                      : widget.note.subtitle;
                  widget.note.save();

                  BlocProvider.of<NotesCubit>(context).getAllNotes();
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextFormField(
                controller: _titleController,
                hintText: widget.note.title,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                controller: _contentController,
                hintText: widget.note.subtitle,
                maxLine: 5,
              ),
              const SizedBox(
                height: 30,
              ),
              EditNoteColor(
                note: widget.note,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
