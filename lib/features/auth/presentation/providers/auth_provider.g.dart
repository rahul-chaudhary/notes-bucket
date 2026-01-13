// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRemoteDatasource)
const authRemoteDatasourceProvider = AuthRemoteDatasourceProvider._();

final class AuthRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<AuthRemoteDatasource>,
          AuthRemoteDatasource,
          FutureOr<AuthRemoteDatasource>
        >
    with
        $FutureModifier<AuthRemoteDatasource>,
        $FutureProvider<AuthRemoteDatasource> {
  const AuthRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRemoteDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRemoteDatasourceHash();

  @$internal
  @override
  $FutureProviderElement<AuthRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AuthRemoteDatasource> create(Ref ref) {
    return authRemoteDatasource(ref);
  }
}

String _$authRemoteDatasourceHash() =>
    r'fd92e11e8196819903999450391c744531185efc';

@ProviderFor(authRepository)
const authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<AuthRepository>,
          AuthRepository,
          FutureOr<AuthRepository>
        >
    with $FutureModifier<AuthRepository>, $FutureProvider<AuthRepository> {
  const AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<AuthRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AuthRepository> create(Ref ref) {
    return authRepository(ref);
  }
}

String _$authRepositoryHash() => r'd69be86afb4f5b95ba00e6b356d8d6eeef7bba09';

@ProviderFor(doesEmailExistUseCase)
const doesEmailExistUseCaseProvider = DoesEmailExistUseCaseProvider._();

final class DoesEmailExistUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<DoesEmailExist>,
          DoesEmailExist,
          FutureOr<DoesEmailExist>
        >
    with $FutureModifier<DoesEmailExist>, $FutureProvider<DoesEmailExist> {
  const DoesEmailExistUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'doesEmailExistUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$doesEmailExistUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<DoesEmailExist> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DoesEmailExist> create(Ref ref) {
    return doesEmailExistUseCase(ref);
  }
}

String _$doesEmailExistUseCaseHash() =>
    r'3930a4060d636116bb9b7cb2db8649b4fc085d03';

@ProviderFor(sendOtpUseCase)
const sendOtpUseCaseProvider = SendOtpUseCaseProvider._();

final class SendOtpUseCaseProvider
    extends $FunctionalProvider<AsyncValue<SendOtp>, SendOtp, FutureOr<SendOtp>>
    with $FutureModifier<SendOtp>, $FutureProvider<SendOtp> {
  const SendOtpUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sendOtpUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sendOtpUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<SendOtp> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<SendOtp> create(Ref ref) {
    return sendOtpUseCase(ref);
  }
}

String _$sendOtpUseCaseHash() => r'b8b32b6d580587426171603ad804cb8512c40cac';

@ProviderFor(authUseCase)
const authUseCaseProvider = AuthUseCaseProvider._();

final class AuthUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<Authentication>,
          Authentication,
          FutureOr<Authentication>
        >
    with $FutureModifier<Authentication>, $FutureProvider<Authentication> {
  const AuthUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<Authentication> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Authentication> create(Ref ref) {
    return authUseCase(ref);
  }
}

String _$authUseCaseHash() => r'076eb080f3eba678b9769ca09477bbc10434c8f0';

@ProviderFor(AuthController)
const authControllerProvider = AuthControllerProvider._();

final class AuthControllerProvider
    extends $AsyncNotifierProvider<AuthController, void> {
  const AuthControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authControllerHash();

  @$internal
  @override
  AuthController create() => AuthController();
}

String _$authControllerHash() => r'5a661639058383dd2ce2da0e78e8291cfa6b6fbd';

abstract class _$AuthController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
