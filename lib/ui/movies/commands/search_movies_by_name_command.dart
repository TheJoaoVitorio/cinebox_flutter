import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/data/repositories/repositories_providers.dart';
import 'package:cinebox_app_flutter/domain/models/movie.dart';
import 'package:cinebox_app_flutter/domain/usecases/usecases_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_movies_by_name_command.g.dart';

@riverpod
class SearchMoviesByNameCommand extends _$SearchMoviesByNameCommand {
  @override
  AsyncValue<List<Movie>> build() => AsyncLoading();

  Future<void> execute(String name) async {
    state = AsyncLoading();
    final searchMovieUC = ref.read(getMoviesBySearchUsecaseProvider);
    final result = await searchMovieUC.execute(search: name);

    state = switch (result) {
      Success(:final value) => AsyncData(value as List<Movie>),
      Failure() => AsyncError(
        Exception('Erro ao buscar filme por nome'),
        StackTrace.current,
      ),
    };
  }
}
