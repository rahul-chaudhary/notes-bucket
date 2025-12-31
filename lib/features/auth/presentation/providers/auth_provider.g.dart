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
          AuthRemoteDatasource,
          AuthRemoteDatasource,
          AuthRemoteDatasource
        >
    with $Provider<AuthRemoteDatasource> {
  const AuthRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<AuthRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthRemoteDatasource create(Ref ref) {
    return authRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRemoteDatasource>(value),
    );
  }
}

String _$authRemoteDatasourceHash() =>
    r'5731f190cb7e881ea3ea2ef83c88a6bb64960ea9';

@ProviderFor(apiClient)
const apiClientProvider = ApiClientProvider._();

final class ApiClientProvider
    extends $FunctionalProvider<ApiClient, ApiClient, ApiClient>
    with $Provider<ApiClient> {
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
  $ProviderElement<ApiClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiClient create(Ref ref) {
    return apiClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiClient>(value),
    );
  }
}

String _$apiClientHash() => r'd4310848561288f96a9b18fcc917832824cd277e';

@ProviderFor(authRepository)
const authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  const AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'2c68f39f0c49eb3c90b12437dd21515f6f457ec2';

@ProviderFor(doesUserExistUseCase)
const doesUserExistUseCaseProvider = DoesUserExistUseCaseProvider._();

final class DoesUserExistUseCaseProvider
    extends $FunctionalProvider<DoesUserExist, DoesUserExist, DoesUserExist>
    with $Provider<DoesUserExist> {
  const DoesUserExistUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'doesUserExistUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$doesUserExistUseCaseHash();

  @$internal
  @override
  $ProviderElement<DoesUserExist> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DoesUserExist create(Ref ref) {
    return doesUserExistUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DoesUserExist value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DoesUserExist>(value),
    );
  }
}

String _$doesUserExistUseCaseHash() =>
    r'4c4b8a8cfd5ba33066ea3f16d2d41c038b9143d7';

@ProviderFor(sendOtpUseCase)
const sendOtpUseCaseProvider = SendOtpUseCaseProvider._();

final class SendOtpUseCaseProvider
    extends $FunctionalProvider<SendOtp, SendOtp, SendOtp>
    with $Provider<SendOtp> {
  const SendOtpUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sendOtpUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sendOtpUseCaseHash();

  @$internal
  @override
  $ProviderElement<SendOtp> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SendOtp create(Ref ref) {
    return sendOtpUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SendOtp value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SendOtp>(value),
    );
  }
}

String _$sendOtpUseCaseHash() => r'5306bf0bf284a66c463a78790a79fd9826d178ad';

@ProviderFor(DoesUserExistNotifier)
const doesUserExistProvider = DoesUserExistNotifierFamily._();

final class DoesUserExistNotifierProvider
    extends $AsyncNotifierProvider<DoesUserExistNotifier, bool> {
  const DoesUserExistNotifierProvider._({
    required DoesUserExistNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'doesUserExistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$doesUserExistNotifierHash();

  @override
  String toString() {
    return r'doesUserExistProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DoesUserExistNotifier create() => DoesUserExistNotifier();

  @override
  bool operator ==(Object other) {
    return other is DoesUserExistNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$doesUserExistNotifierHash() =>
    r'61f0e51db6d526b199ed62356c974702c893c639';

final class DoesUserExistNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          DoesUserExistNotifier,
          AsyncValue<bool>,
          bool,
          FutureOr<bool>,
          String
        > {
  const DoesUserExistNotifierFamily._()
    : super(
        retry: null,
        name: r'doesUserExistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DoesUserExistNotifierProvider call(String email) =>
      DoesUserExistNotifierProvider._(argument: email, from: this);

  @override
  String toString() => r'doesUserExistProvider';
}

abstract class _$DoesUserExistNotifier extends $AsyncNotifier<bool> {
  late final _$args = ref.$arg as String;
  String get email => _$args;

  FutureOr<bool> build(String email);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SendOtpNotifier)
const sendOtpProvider = SendOtpNotifierFamily._();

final class SendOtpNotifierProvider
    extends $AsyncNotifierProvider<SendOtpNotifier, String> {
  const SendOtpNotifierProvider._({
    required SendOtpNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sendOtpProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sendOtpNotifierHash();

  @override
  String toString() {
    return r'sendOtpProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SendOtpNotifier create() => SendOtpNotifier();

  @override
  bool operator ==(Object other) {
    return other is SendOtpNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sendOtpNotifierHash() => r'9bce5bbce5ddd038ef9aa1b21a35023a6b8b9ff8';

final class SendOtpNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          SendOtpNotifier,
          AsyncValue<String>,
          String,
          FutureOr<String>,
          String
        > {
  const SendOtpNotifierFamily._()
    : super(
        retry: null,
        name: r'sendOtpProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SendOtpNotifierProvider call(String email) =>
      SendOtpNotifierProvider._(argument: email, from: this);

  @override
  String toString() => r'sendOtpProvider';
}

abstract class _$SendOtpNotifier extends $AsyncNotifier<String> {
  late final _$args = ref.$arg as String;
  String get email => _$args;

  FutureOr<String> build(String email);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
