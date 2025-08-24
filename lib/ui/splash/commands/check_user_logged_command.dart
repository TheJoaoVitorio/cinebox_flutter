import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/data/repositories/repositories_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_user_logged_command.g.dart';

@riverpod
class CheckUserLoggedCommand extends _$CheckUserLoggedCommand {
  @override
  Future<bool?> build() async => null;

  Future<void> execute() async {
    state = AsyncLoading();

    final authRepository = ref.read(authRepositoryProvider);
    final isLoggedResult = await authRepository.isLogged();

    state = switch (isLoggedResult) {
      Success(value: final isLogged) => AsyncValue.data(isLogged),
      Failure(:final error) => AsyncValue.error(error, StackTrace.current),
    };
  }
}
