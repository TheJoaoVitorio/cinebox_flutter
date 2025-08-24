import 'package:cinebox_app_flutter/data/repositories/auth/auth_repository.dart';
import 'package:cinebox_app_flutter/data/repositories/auth/auth_repository_impl.dart';
import 'package:cinebox_app_flutter/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox_app_flutter/data/repositories/tmdb/tmdb_repository_impl.dart';
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

@riverpod
TmdbRepository tmdbRepository(Ref ref) {
  return TmdbRepositoryImpl(
    tmdbService: ref.read(tmdbServiceProvider),
  );
}
