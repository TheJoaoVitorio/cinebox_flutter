import 'dart:developer';

import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/data/core/repositories/auth/auth_repository.dart';
import 'package:cinebox_app_flutter/data/exceptions/data_exception.dart';
import 'package:cinebox_app_flutter/data/services/auth/auth_service.dart';
import 'package:cinebox_app_flutter/data/services/google_sign_in/google_sign_in_service.dart';
import 'package:cinebox_app_flutter/data/services/local_storage/local_storage_service.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalStorageService _localStorageService;
  final GoogleSignInService _googleSignInService;
  final AuthService _authService;

  AuthRepositoryImpl({
    required LocalStorageService localStorageService,
    required GoogleSignInService googleSignInService,
    required AuthService authService,
  }) : _localStorageService = localStorageService,
       _googleSignInService = googleSignInService,
       _authService = authService;

  @override
  Future<Result<bool>> isLogged() async {
    final resultToken = await _localStorageService.getIdToken();

    return switch (resultToken) {
      Success<String?>() => Success(true),
      Failure<String?>() => Success(false),
    };
  }

  @override
  Future<Result<Unit>> signIn() async {
    final result = await _googleSignInService.signInWithGoogle();
    switch (result) {
      case Success<String>(:final value):
        try {
          try {
            await _localStorageService.saveIdToken(value);

            await _authService.auth();

            return successOfUnit();
          } on DioException catch (e, s) {
            log(
              'Erro ao autenticar o usuário no backend',
              name: 'AuthRepository',
              error: e,
              stackTrace: s,
            );
            return Failure(
              DataException('Erro ao realizar login no backend'),
            );
          }
        } on DioException catch (e, s) {
          log(
            'Erro ao autenticar o usuário no backend',
            name: 'AuthRepository',
            error: e,
            stackTrace: s,
          );
          return Failure(
            DataException('Erro ao realizar login no backend'),
          );
        }
      case Failure<String>(:final error):
        log(
          'Erro ao realizar login com o Google',
          name: 'AuthRepository',
          error: error,
        );
        return Failure(
          DataException('Erro ao realizar login com a Google'),
        );
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    final result = await _googleSignInService.signOutFromGoogle();
    switch (result) {
      case Success<Unit>():
        final removeResult = await _localStorageService.removeIdToken();
        switch (removeResult) {
          case Success<Unit>():
            return successOfUnit();
          case Failure<Unit>(:final error):
            log('Erro ao realizar logout ID Token');
            return Failure(error);
        }
      case Failure<Unit>(:final error):
        return Failure(error);
    }
  }
}
