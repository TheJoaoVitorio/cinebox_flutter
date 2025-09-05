import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/data/repositories/movies/movies_repository.dart';
import 'package:cinebox_app_flutter/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox_app_flutter/domain/models/favorite_movie.dart';
import 'package:cinebox_app_flutter/domain/models/movie.dart';
import 'package:cinebox_app_flutter/domain/models/movies_by_category.dart';
import 'package:cinebox_app_flutter/domain/usecases/extensions/mark_favorite_extension.dart';

class GetMoviesByCategoryUsecase {
  final TmdbRepository _tmdbRepository;
  final MoviesRepository _moviesRepository;

  GetMoviesByCategoryUsecase({
    required TmdbRepository tmdbRepository,
    required MoviesRepository moviesRepository,
  }) : _tmdbRepository = tmdbRepository,
       _moviesRepository = moviesRepository;

  Future<Result<MoviesByCategory>> execute() async {
    final results = await Future.wait([
      _moviesRepository.getMyFavoritesMovies(),
      _tmdbRepository.getNowPlayingMovies(),
      _tmdbRepository.getTopRatedMovies(),
      _tmdbRepository.getUpComingMovies(),
      _tmdbRepository.getPopularMovies(),
    ]);

    if (results case [
      Success<List<FavoriteMovie>>(value: final favorites),
      Success<List<Movie>>(value: final nowPlaying),
      Success<List<Movie>>(value: final topRated),
      Success<List<Movie>>(value: final upComing),
      Success<List<Movie>>(value: final popular),
    ]) {

      final favoritesIds = favorites.map((f) => f.id).toList();

      return Success(
        MoviesByCategory(
          nowPlaying: nowPlaying.markAsFavorite(favoritesIds),
          topRated: topRated.markAsFavorite(favoritesIds),
          upComing: upComing.markAsFavorite(favoritesIds),
          popular: popular.markAsFavorite(favoritesIds),
        ),
      );
    }

    return Failure(Exception('Erro ao buscar filmes por categoria'));
  }
}
