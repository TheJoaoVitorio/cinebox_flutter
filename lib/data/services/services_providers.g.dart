// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(localStorageService)
const localStorageServiceProvider = LocalStorageServiceProvider._();

final class LocalStorageServiceProvider
    extends
        $FunctionalProvider<
          LocalStorageService,
          LocalStorageService,
          LocalStorageService
        >
    with $Provider<LocalStorageService> {
  const LocalStorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localStorageServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localStorageServiceHash();

  @$internal
  @override
  $ProviderElement<LocalStorageService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalStorageService create(Ref ref) {
    return localStorageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalStorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalStorageService>(value),
    );
  }
}

String _$localStorageServiceHash() =>
    r'6393dfa3b7044bce3761873180d69dc9438297b5';

@ProviderFor(googleSignInService)
const googleSignInServiceProvider = GoogleSignInServiceProvider._();

final class GoogleSignInServiceProvider
    extends
        $FunctionalProvider<
          GoogleSignInService,
          GoogleSignInService,
          GoogleSignInService
        >
    with $Provider<GoogleSignInService> {
  const GoogleSignInServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'googleSignInServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$googleSignInServiceHash();

  @$internal
  @override
  $ProviderElement<GoogleSignInService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GoogleSignInService create(Ref ref) {
    return googleSignInService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoogleSignInService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoogleSignInService>(value),
    );
  }
}

String _$googleSignInServiceHash() =>
    r'b9fa3f757aa07855458a9cafdd23c0494a867f59';

@ProviderFor(authService)
const authServiceProvider = AuthServiceProvider._();

final class AuthServiceProvider
    extends $FunctionalProvider<AuthService, AuthService, AuthService>
    with $Provider<AuthService> {
  const AuthServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authServiceHash();

  @$internal
  @override
  $ProviderElement<AuthService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthService create(Ref ref) {
    return authService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthService>(value),
    );
  }
}

String _$authServiceHash() => r'0ec29a3b3d1d112a0e94b59b92eda9ba461fa04d';

@ProviderFor(tmdbService)
const tmdbServiceProvider = TmdbServiceProvider._();

final class TmdbServiceProvider
    extends $FunctionalProvider<TmdbService, TmdbService, TmdbService>
    with $Provider<TmdbService> {
  const TmdbServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tmdbServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tmdbServiceHash();

  @$internal
  @override
  $ProviderElement<TmdbService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TmdbService create(Ref ref) {
    return tmdbService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TmdbService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TmdbService>(value),
    );
  }
}

String _$tmdbServiceHash() => r'440547d0909c91f7b9dfdbcc26b73ee660147c69';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
