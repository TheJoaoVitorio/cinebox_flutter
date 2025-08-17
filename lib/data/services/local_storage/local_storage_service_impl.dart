import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import './local_storage_service.dart';

class LocalStorageServiceImpl implements LocalStorageService {
  final FlutterSecureStorage _flutterSecureStorage;

  LocalStorageServiceImpl({required FlutterSecureStorage flutterSecureStorage})
    : _flutterSecureStorage = flutterSecureStorage;

  @override
  Future<Result<String?>> getIdToken() async {
    final idToken = await _flutterSecureStorage.read(key: 'id_token');
    if (idToken != null) {
      return Success(idToken);
    }

    return Failure(Exception('No ID token found'));
  }

  @override
  Future<Result<Unit>> removeIdToken() async {
    await _flutterSecureStorage.delete(key: 'id_token');
    return successOfUnit();
  }

  @override
  Future<Result<Unit>> saveIdToken(String idToken) async {
    await _flutterSecureStorage.write(key: 'id_token', value: idToken);
    return successOfUnit();
  }
}
