import 'dart:developer';

import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/data/exceptions/data_exception.dart';
import 'package:cinebox_app_flutter/data/services/google_sign_in/google_sign_in_service.dart';
import 'package:cinebox_app_flutter/data/services/local_storage/local_storage_service.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalStorageService _localStorageService;
  final GoogleSignInService _googleSignInService;

  AuthRepositoryImpl({
    required LocalStorageService localStorageService,
    required GoogleSignInService googleSignInService,
  }) : _localStorageService = localStorageService,
       _googleSignInService = googleSignInService;

  @override
  Future<Result<bool>> isLogged() async {
    final resultToken = await _localStorageService.getIdToken();

    return switch(resultToken) {
      Success<String?>() => Success(true),
      Failure<String?>() => Success(false)
    };
  }

  @override
  Future<Result<Unit>> signIn() async {
    final result = await _googleSignInService.signInWithGoogle();

    switch (result) {
      case Success<String>(:final value):
        await _localStorageService.saveIdToken(value);
        return successOfUnit();
      case Failure<String>(:final error):
        log(
          'Failed to sign in with Google',
          name: 'AuthRepositoryImpl',
          error: error,
        );
        return Failure(DataException('Failed to sign in with Google }'));
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
            log(
              'Failed to remove ID token from local storage',
              name: 'AuthRepositoryImpl',
              error: error,
            );
            return Failure(error);
        }

      case Failure<Unit>(:final error):
        log(
          'Failed to sign out from Google',
          name: 'AuthRepositoryImpl',
          error: error,
        );
        return Failure(DataException('Failed to sign out from Google'));
    }
  }
}
