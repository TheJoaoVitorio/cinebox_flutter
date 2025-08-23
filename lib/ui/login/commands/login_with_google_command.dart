import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/data/repositories/repositories_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_with_google_command.g.dart';

@riverpod
class LoginWithGoogleCommand extends _$LoginWithGoogleCommand {
  @override
  AsyncValue<void> build() => AsyncData(null);

  Future<void> execute() async {
    state = AsyncLoading();

    final authRepository = ref.read(authRepositoryProvider);

    final result = await authRepository.signIn();

    switch (result) {
      case Success<Unit>():
        state = AsyncData(null);
      case Failure<Unit>():
        state = AsyncError('Error in sign in with google', StackTrace.current);
    }
  }
}
