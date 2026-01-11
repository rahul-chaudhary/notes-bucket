// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_quote_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dailyQuoteLocalDatasource)
const dailyQuoteLocalDatasourceProvider = DailyQuoteLocalDatasourceProvider._();

final class DailyQuoteLocalDatasourceProvider
    extends
        $FunctionalProvider<
          DailyQuoteLocalDatasource,
          DailyQuoteLocalDatasource,
          DailyQuoteLocalDatasource
        >
    with $Provider<DailyQuoteLocalDatasource> {
  const DailyQuoteLocalDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dailyQuoteLocalDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dailyQuoteLocalDatasourceHash();

  @$internal
  @override
  $ProviderElement<DailyQuoteLocalDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DailyQuoteLocalDatasource create(Ref ref) {
    return dailyQuoteLocalDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DailyQuoteLocalDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DailyQuoteLocalDatasource>(value),
    );
  }
}

String _$dailyQuoteLocalDatasourceHash() =>
    r'3e409ad6da9bc0159855984fbbae2e8e9e9c4b9e';

@ProviderFor(dailyQuoteRemoteDatasource)
const dailyQuoteRemoteDatasourceProvider =
    DailyQuoteRemoteDatasourceProvider._();

final class DailyQuoteRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<DailyQuoteRemoteDatasource>,
          DailyQuoteRemoteDatasource,
          FutureOr<DailyQuoteRemoteDatasource>
        >
    with
        $FutureModifier<DailyQuoteRemoteDatasource>,
        $FutureProvider<DailyQuoteRemoteDatasource> {
  const DailyQuoteRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dailyQuoteRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dailyQuoteRemoteDatasourceHash();

  @$internal
  @override
  $FutureProviderElement<DailyQuoteRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DailyQuoteRemoteDatasource> create(Ref ref) {
    return dailyQuoteRemoteDatasource(ref);
  }
}

String _$dailyQuoteRemoteDatasourceHash() =>
    r'f0f0846d20b09de0229e5defde43bdffb1c80a42';

@ProviderFor(dailyQuoteRepository)
const dailyQuoteRepositoryProvider = DailyQuoteRepositoryProvider._();

final class DailyQuoteRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<DailyQuoteRepository>,
          DailyQuoteRepository,
          FutureOr<DailyQuoteRepository>
        >
    with
        $FutureModifier<DailyQuoteRepository>,
        $FutureProvider<DailyQuoteRepository> {
  const DailyQuoteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dailyQuoteRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dailyQuoteRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<DailyQuoteRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DailyQuoteRepository> create(Ref ref) {
    return dailyQuoteRepository(ref);
  }
}

String _$dailyQuoteRepositoryHash() =>
    r'3a7f9549f0ce601f245241f3ab3f9ca4dea453ad';

@ProviderFor(fetchDailyQuoteUseCase)
const fetchDailyQuoteUseCaseProvider = FetchDailyQuoteUseCaseProvider._();

final class FetchDailyQuoteUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<FetchDailyQuote>,
          FetchDailyQuote,
          FutureOr<FetchDailyQuote>
        >
    with $FutureModifier<FetchDailyQuote>, $FutureProvider<FetchDailyQuote> {
  const FetchDailyQuoteUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchDailyQuoteUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchDailyQuoteUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<FetchDailyQuote> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FetchDailyQuote> create(Ref ref) {
    return fetchDailyQuoteUseCase(ref);
  }
}

String _$fetchDailyQuoteUseCaseHash() =>
    r'f570254365a3a9d0009987e8279af9766b3c3b2c';

@ProviderFor(DailyQuoteNotifier)
const dailyQuoteProvider = DailyQuoteNotifierProvider._();

final class DailyQuoteNotifierProvider
    extends $AsyncNotifierProvider<DailyQuoteNotifier, DailyQuote> {
  const DailyQuoteNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dailyQuoteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dailyQuoteNotifierHash();

  @$internal
  @override
  DailyQuoteNotifier create() => DailyQuoteNotifier();
}

String _$dailyQuoteNotifierHash() =>
    r'95461ddda8cfef953675c9254194d3491d6e8a1c';

abstract class _$DailyQuoteNotifier extends $AsyncNotifier<DailyQuote> {
  FutureOr<DailyQuote> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<DailyQuote>, DailyQuote>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DailyQuote>, DailyQuote>,
              AsyncValue<DailyQuote>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
