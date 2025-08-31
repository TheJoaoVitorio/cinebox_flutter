import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox_app_flutter/domain/models/movie.dart';

class GetMoviesBySearchUsecase {
  final TmdbRepository _tmdbRepository;

  GetMoviesBySearchUsecase({required TmdbRepository tmdbRepository})
    : _tmdbRepository = tmdbRepository;

  Future<Result<List<Movie>>> execute({required String search}) async {
    final result = await _tmdbRepository.getMoviesBySearch(query: search);
    return result;
  }
}
