import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox_app_flutter/domain/models/movie.dart';

class GetMoviesByGenreUsecase {
  final TmdbRepository _tmdbRepository;

  GetMoviesByGenreUsecase({required TmdbRepository tmdbRepository})
    : _tmdbRepository = tmdbRepository;

  Future<Result<List<Movie>>> execute({required int genreId}) async {
    final result = await _tmdbRepository.getMoviesByGenre(genreId: genreId);

    return result;
  }
}
