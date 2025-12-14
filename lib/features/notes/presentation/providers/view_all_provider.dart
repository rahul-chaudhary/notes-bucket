import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_all_provider.g.dart';

/// Holds the currently selected parent folder ID for navigation
@riverpod
class SelectedParentId extends _$SelectedParentId {
  @override
  int? build() => null;

  void setId(int? id) => state = id;

  void reset() => state = null;
}