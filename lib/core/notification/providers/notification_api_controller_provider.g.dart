// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_api_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notificationApiController)
const notificationApiControllerProvider = NotificationApiControllerProvider._();

final class NotificationApiControllerProvider
    extends
        $FunctionalProvider<
          AsyncValue<NotificationApiController>,
          NotificationApiController,
          FutureOr<NotificationApiController>
        >
    with
        $FutureModifier<NotificationApiController>,
        $FutureProvider<NotificationApiController> {
  const NotificationApiControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationApiControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationApiControllerHash();

  @$internal
  @override
  $FutureProviderElement<NotificationApiController> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<NotificationApiController> create(Ref ref) {
    return notificationApiController(ref);
  }
}

String _$notificationApiControllerHash() =>
    r'c6c0ad6c7c1000317efa4cb16ce7bcec3ab28afa';
