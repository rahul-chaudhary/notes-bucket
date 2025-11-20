import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as connectivity;

part 'internet_status.g.dart';

enum InternetStatus { connected, disconnected }

@riverpod
class InternetListener extends _$InternetListener {
  @override
  InternetStatus build() {
    startListening();
    return InternetStatus.disconnected;
  }

  void startListening() {
    final subscription = connectivity.InternetConnection().onStatusChange
        .debounceTime(const Duration(seconds: 1))
        .listen((connectivity.InternetStatus status) {
          state = status == connectivity.InternetStatus.connected
              ? InternetStatus.connected
              : InternetStatus.disconnected;
        });

    ref.onDispose(subscription.cancel);
  }
}
