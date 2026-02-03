// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sync_status_enum.dart';

class SyncStatusMapper extends EnumMapper<SyncStatus> {
  SyncStatusMapper._();

  static SyncStatusMapper? _instance;
  static SyncStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SyncStatusMapper._());
    }
    return _instance!;
  }

  static SyncStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  SyncStatus decode(dynamic value) {
    switch (value) {
      case r'synced':
        return SyncStatus.synced;
      case r'pendingCreate':
        return SyncStatus.pendingCreate;
      case r'pendingUpdate':
        return SyncStatus.pendingUpdate;
      case r'pendingDelete':
        return SyncStatus.pendingDelete;
      case r'conflict':
        return SyncStatus.conflict;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(SyncStatus self) {
    switch (self) {
      case SyncStatus.synced:
        return r'synced';
      case SyncStatus.pendingCreate:
        return r'pendingCreate';
      case SyncStatus.pendingUpdate:
        return r'pendingUpdate';
      case SyncStatus.pendingDelete:
        return r'pendingDelete';
      case SyncStatus.conflict:
        return r'conflict';
    }
  }
}

extension SyncStatusMapperExtension on SyncStatus {
  String toValue() {
    SyncStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<SyncStatus>(this) as String;
  }
}

