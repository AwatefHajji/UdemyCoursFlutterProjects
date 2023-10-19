class AddNoteState {}

class AddNoteInitialState extends AddNoteState {}

class AddNoteLoadingState extends AddNoteState {}

class AddNoteSuccessState extends AddNoteState {}

class AddNoteErrorState extends AddNoteState {
  final String errMessage;

  AddNoteErrorState(this.errMessage);
}
