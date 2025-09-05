import 'package:cinebox_app_flutter/data/repositories/repositories_providers.dart';
import 'package:cinebox_app_flutter/domain/usecases/get_movies_by_category_usecase.dart';
import 'package:cinebox_app_flutter/domain/usecases/get_movies_by_genre_usecase.dart';
import 'package:cinebox_app_flutter/domain/usecases/get_movies_by_search_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecases_providers.g.dart';

@riverpod
GetMoviesByCategoryUsecase getMoviesByCategoryUsecase(Ref ref) {
  return GetMoviesByCategoryUsecase(
    tmdbRepository: ref.read(tmdbRepositoryProvider),
    moviesRepository: ref.read(moviesRepositoryProvider)
  );
}

@riverpod
GetMoviesByGenreUsecase getMoviesByGenreUsecase(Ref ref) {
  return GetMoviesByGenreUsecase(
    tmdbRepository: ref.read(tmdbRepositoryProvider),
    moviesRepository: ref.read(moviesRepositoryProvider)
  );
}

@riverpod
GetMoviesBySearchUsecase getMoviesBySearchUsecase(Ref ref) {
  return GetMoviesBySearchUsecase(
    tmdbRepository: ref.read(tmdbRepositoryProvider),
    moviesRepository: ref.read(moviesRepositoryProvider)
  );
}
