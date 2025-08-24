import 'package:cinebox_app_flutter/data/core/repositories/auth/auth_repository.dart';
import 'package:cinebox_app_flutter/data/core/repositories/auth/auth_repository_impl.dart';
import 'package:cinebox_app_flutter/data/services/services_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'repositories_providers.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    localStorageService: ref.read(localStorageServiceProvider),
    googleSignInService: ref.read(googleSignInServiceProvider),
    authService: ref.read(authServiceProvider),
  );
}
