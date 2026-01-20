import 'package:notes_bucket/features/sync/sync_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../notes/presentation/providers/folder_provider.dart';
import '../notes/presentation/providers/notes_provider.dart';

part 'sync_service_provider.g.dart';

@Riverpod(keepAlive: true)
Future<SyncService> syncService(Ref ref) async {
  final noteRemote = await ref.watch(noteRemoteDatasourceProvider.future);
  final noteLocal = ref.watch(noteLocalDataSourceProvider);
  final folderRemote = await ref.watch(folderRemoteDatasourceProvider.future);
  final folderLocal = ref.watch(folderLocalDataSourceProvider);

  final monitor = ref.read(syncMonitorProvider.notifier);

  final service = SyncService(
    noteRemote: noteRemote,
    noteLocal: noteLocal,
    folderRemote: folderRemote,
    folderLocal: folderLocal,
    onStateChanged: monitor.update,
  );
  await service.start();
  return service;
}


@Riverpod(keepAlive: true)
class SyncMonitor extends _$SyncMonitor {
  @override
  SyncState build() => const SyncState.idle();

  void update(SyncState state) {
    this.state = state;
  }
}
