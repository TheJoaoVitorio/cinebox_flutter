import 'dart:developer';

import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/data/services/google_sign_in/google_sign_in_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInServiceImpl implements GoogleSignInService {
  @override
  Future<Result<String?>> isSignedIn() async {
    try {
      final logged = await GoogleSignIn.instance
          .attemptLightweightAuthentication();

      if (logged case GoogleSignInAccount(
        authentication: GoogleSignInAuthentication(:final idToken?),
      )) {
        return Success(idToken);
      }

      return Failure(
        Exception('User is not signed in with Google'),
      );
    } catch (e, s) {
      log(
        'User is not signed in with Google',
        name: 'GoogleSignInService',
        error: e,
        stackTrace: s,
      );

      return Failure(
        Exception('User is not signed in with Google'),
      );
    }
  }

  @override
  Future<Result<String>> signInWithGoogle() async {
    try {
      final auth = await GoogleSignIn.instance.authenticate(
        scopeHint: ['email', 'profile', 'openid'],
      );

      if (auth.authentication case GoogleSignInAuthentication(
        idToken: final idToken?,
      )) {
        return Success(idToken);
      }

      return Failure(
        Exception('Failed to retrieve ID token from Google Sign-In'),
      );
    } catch (e, s) {
      log(
        'Failed to retrieve ID token from Google Sign-In',
        name: 'GoogleSignInService',
        error: e,
        stackTrace: s,
      );

      return Failure(
        Exception('Failed to retrieve ID token from Google Sign-In'),
      );
    }
  }

  @override
  Future<Result<Unit>> signOutFromGoogle() async {
    try {
      await GoogleSignIn.instance.signOut();
      return successOfUnit();
    } catch (e, s) {
      log(
        'Failed to retrieve Sign Out from Google Sign-In',
        name: 'GoogleSignInService',
        error: e,
        stackTrace: s,
      );

      return Failure(
        Exception('Failed to retrieve Sign Out from Google Sign-In'),
      );
    }
  }
}
