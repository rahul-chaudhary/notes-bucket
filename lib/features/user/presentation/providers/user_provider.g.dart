// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userRemoteDatasource)
const userRemoteDatasourceProvider = UserRemoteDatasourceProvider._();

final class UserRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserRemoteDatasource>,
          UserRemoteDatasource,
          FutureOr<UserRemoteDatasource>
        >
    with
        $FutureModifier<UserRemoteDatasource>,
        $FutureProvider<UserRemoteDatasource> {
  const UserRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRemoteDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRemoteDatasourceHash();

  @$internal
  @override
  $FutureProviderElement<UserRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserRemoteDatasource> create(Ref ref) {
    return userRemoteDatasource(ref);
  }
}

String _$userRemoteDatasourceHash() =>
    r'1fd68a705b94e8844e5e6b82df001b321fa241ae';

@ProviderFor(userRepository)
const userRepositoryProvider = UserRepositoryProvider._();

final class UserRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserRepository>,
          UserRepository,
          FutureOr<UserRepository>
        >
    with $FutureModifier<UserRepository>, $FutureProvider<UserRepository> {
  const UserRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<UserRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserRepository> create(Ref ref) {
    return userRepository(ref);
  }
}

String _$userRepositoryHash() => r'8805856c237a2154e5121bbc5fdc4cf07adc9d31';

@ProviderFor(fetchUserUseCase)
const fetchUserUseCaseProvider = FetchUserUseCaseProvider._();

final class FetchUserUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<FetchUser>,
          FetchUser,
          FutureOr<FetchUser>
        >
    with $FutureModifier<FetchUser>, $FutureProvider<FetchUser> {
  const FetchUserUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchUserUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchUserUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<FetchUser> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<FetchUser> create(Ref ref) {
    return fetchUserUseCase(ref);
  }
}

String _$fetchUserUseCaseHash() => r'732526b258f1577e27b719b7ec6c9b5596b3f5ee';

@ProviderFor(activateUserSubscriptionUseCase)
const activateUserSubscriptionUseCaseProvider =
    ActivateUserSubscriptionUseCaseProvider._();

final class ActivateUserSubscriptionUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<ActivateUserSubscription>,
          ActivateUserSubscription,
          FutureOr<ActivateUserSubscription>
        >
    with
        $FutureModifier<ActivateUserSubscription>,
        $FutureProvider<ActivateUserSubscription> {
  const ActivateUserSubscriptionUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activateUserSubscriptionUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activateUserSubscriptionUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<ActivateUserSubscription> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ActivateUserSubscription> create(Ref ref) {
    return activateUserSubscriptionUseCase(ref);
  }
}

String _$activateUserSubscriptionUseCaseHash() =>
    r'9508c4eec7a78c089603363417915095f9d3c658';

@ProviderFor(UserNotifier)
const userProvider = UserNotifierProvider._();

final class UserNotifierProvider
    extends $AsyncNotifierProvider<UserNotifier, User?> {
  const UserNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userNotifierHash();

  @$internal
  @override
  UserNotifier create() => UserNotifier();
}

String _$userNotifierHash() => r'a2f5aaaca74c57935cc20456df6180546f6816d3';

abstract class _$UserNotifier extends $AsyncNotifier<User?> {
  FutureOr<User?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<User?>, User?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<User?>, User?>,
              AsyncValue<User?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
