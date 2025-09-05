import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/data/repositories/movies/movies_repository.dart';
import 'package:cinebox_app_flutter/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox_app_flutter/domain/models/favorite_movie.dart';
import 'package:cinebox_app_flutter/domain/models/movie.dart';
import 'package:cinebox_app_flutter/domain/usecases/extensions/mark_favorite_extension.dart';

class GetMoviesByGenreUsecase {
  final TmdbRepository _tmdbRepository;
  final MoviesRepository _moviesRepository;

  GetMoviesByGenreUsecase({
    required TmdbRepository tmdbRepository,
    required MoviesRepository moviesRepository,
  }) : _tmdbRepository = tmdbRepository,
       _moviesRepository = moviesRepository;

  Future<Result<List<Movie>>> execute({required int genreId}) async {
    final results = await Future.wait([
      _moviesRepository.getMyFavoritesMovies(),
      _tmdbRepository.getMoviesByGenre(genreId: genreId),
    ]);

    if (results case [
      Success<List<FavoriteMovie>>(value: final favorites),
      Success<List<Movie>>(value: final movieByGenre),
    ]) {
      final favoritesIds = favorites.map((f) => f.id).toList();

      return Success(movieByGenre.markAsFavorite(favoritesIds));
    }

    return Failure(Exception('Failed to fetch movies by genre.'));
  }
}
