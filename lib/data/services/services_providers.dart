import 'package:cinebox_app_flutter/data/services/google_sign_in/google_sign_in_service.dart';
import 'package:cinebox_app_flutter/data/services/google_sign_in/google_sign_in_service_impl.dart';
import 'package:cinebox_app_flutter/data/services/local_storage/local_storage_service.dart';
import 'package:cinebox_app_flutter/data/services/local_storage/local_storage_service_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services_providers.g.dart';

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref){
  return LocalStorageServiceImpl(
    flutterSecureStorage: FlutterSecureStorage(),
  );
}

@Riverpod(keepAlive: true)
GoogleSignInService googleSignInService(Ref ref) {
  return GoogleSignInServiceImpl();
}