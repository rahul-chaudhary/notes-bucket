import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_note_state_provider.g.dart';

@riverpod
class WarningText extends _$WarningText {
  @override
  String build() => '';
  void setWarningText(String text) => state = text;
}

@riverpod
class EditNoteLoadingState extends _$EditNoteLoadingState {
  @override
  bool build() => false;

  Future<void> set(bool isLoading) async {
    state = isLoading;
  }
}

@riverpod
class EditNoteState extends _$EditNoteState {
  @override
  NoteEntity? build() => null;

  void set(NoteEntity? note)  {
    state = note;
  }
}