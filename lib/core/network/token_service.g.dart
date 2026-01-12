// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tokenService)
const tokenServiceProvider = TokenServiceProvider._();

final class TokenServiceProvider
    extends
        $FunctionalProvider<
          AsyncValue<TokenService>,
          TokenService,
          FutureOr<TokenService>
        >
    with $FutureModifier<TokenService>, $FutureProvider<TokenService> {
  const TokenServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tokenServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tokenServiceHash();

  @$internal
  @override
  $FutureProviderElement<TokenService> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TokenService> create(Ref ref) {
    return tokenService(ref);
  }
}

String _$tokenServiceHash() => r'9143ae973b7e0e462afc6e153b4acd57def38170';
