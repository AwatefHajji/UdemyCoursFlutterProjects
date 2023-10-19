import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/custtom_button.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});
  static String id = 'add-note';

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode mode = AutovalidateMode.disabled;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteLoadingState) {
          isLoading = true;
        }
        if (state is AddNoteSuccessState) {
          isLoading = false;
          BlocProvider.of<NotesCubit>(context).getAllNotes();
          Navigator.pop(context);
        }
        if (state is AddNoteErrorState) {
          print('failed ${state.errMessage}');
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddNoteLoadingState ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                autovalidateMode: mode,
                child: Column(children: [
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    hintText: 'Note Title',
                    controller: _titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    hintText: 'Content',
                    controller: _contentController,
                    maxLine: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a content';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ColorsListView(),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    isLoading: state is AddNoteLoadingState ? true : false,
                    onTap: () {
                      _submitForm();
                    },
                  )
                ]),
              ),
            ),
          ),
        );
      },
    );
  }

  void _submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      // Form is valid, proceed with save the note in the local database
      var currentDate = DateTime.now();
      var formattedCurrentDate = DateFormat('dd-mm-yyyy').format(currentDate);
      context.read<AddNoteCubit>().addNote(
            NoteModel(
              date: formattedCurrentDate,
              title: _titleController.text,
              subtitle: _contentController.text,
              color: Colors.grey.value,
            ),
          );
    } else {
      // Form is not valid, update autovalidateMode to display errors
      setState(() {
        mode = AutovalidateMode.always;
      });
    }
  }
}
