import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_note_state_provider.g.dart';


@riverpod
class WarningText extends _$WarningText {
  @override
  String build() => '';

  void setWarningText(String text) => state = text;

}