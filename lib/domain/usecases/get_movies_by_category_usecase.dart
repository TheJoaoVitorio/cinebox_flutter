import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox_app_flutter/domain/models/movie.dart';
import 'package:cinebox_app_flutter/domain/models/movies_by_category.dart';

class GetMoviesByCategoryUsecase {
  final TmdbRepository _tmdbRepository;

  GetMoviesByCategoryUsecase({
    required TmdbRepository tmdbRepository,
  }) : _tmdbRepository = tmdbRepository;

  Future<Result<MoviesByCategory>> execute() async {

    final results = await Future.wait([
      _tmdbRepository.getNowPlayingMovies(),
      _tmdbRepository.getTopRatedMovies(),
      _tmdbRepository.getUpComingMovies(),
      _tmdbRepository.getPopularMovies(),
    ]);

    if (results case [
      Success<List<Movie>>(value :final nowPlaying),
      Success<List<Movie>>(value :final topRated),
      Success<List<Movie>>(value :final upComing),
      Success<List<Movie>>(value :final popular),
    ]){
      return Success(MoviesByCategory(
        nowPlaying: nowPlaying,
        topRated: topRated,
        upComing: upComing,
        popular: popular,
      ));
    }

    return Failure(Exception('Erro ao buscar filmes por categoria'));

  }

}
