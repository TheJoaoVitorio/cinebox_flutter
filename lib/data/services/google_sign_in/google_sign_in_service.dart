import 'package:cinebox_app_flutter/core/result/result.dart';

abstract interface  class GoogleSignInService {
  Future<Result<String>> signInWithGoogle();

  Future<Result<Unit>> signOutFromGoogle();

  Future<Result<String?>> isSignedIn();
}