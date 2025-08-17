import 'package:cinebox_app_flutter/core/result/result.dart';

abstract interface class LocalStorageService {
  Future<Result<Unit>> saveIdToken(String idToken);

  Future<Result<String?>> getIdToken();

  Future<Result<Unit>> removeIdToken();
}