// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(baseDio)
const baseDioProvider = BaseDioProvider._();

final class BaseDioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const BaseDioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'baseDioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$baseDioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return baseDio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$baseDioHash() => r'dbaee855de94b8fe5d4ae9cc2101ca392465de47';

@ProviderFor(dio)
const dioProvider = DioProvider._();

final class DioProvider
    extends $FunctionalProvider<AsyncValue<Dio>, Dio, FutureOr<Dio>>
    with $FutureModifier<Dio>, $FutureProvider<Dio> {
  const DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $FutureProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Dio> create(Ref ref) {
    return dio(ref);
  }
}

String _$dioHash() => r'10b2946bae303a78158b784224030668c77eb216';

@ProviderFor(apiClient)
const apiClientProvider = ApiClientProvider._();

final class ApiClientProvider
    extends
        $FunctionalProvider<
          AsyncValue<ApiClient>,
          ApiClient,
          FutureOr<ApiClient>
        >
    with $FutureModifier<ApiClient>, $FutureProvider<ApiClient> {
  const ApiClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiClientHash();

  @$internal
  @override
  $FutureProviderElement<ApiClient> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ApiClient> create(Ref ref) {
    return apiClient(ref);
  }
}

String _$apiClientHash() => r'074dfc916db82e3d6dc31d60b56315c75626de9b';
