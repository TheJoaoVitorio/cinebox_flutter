import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/data/repositories/movies/movies_repository.dart';
import 'package:cinebox_app_flutter/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox_app_flutter/domain/models/favorite_movie.dart';
import 'package:cinebox_app_flutter/domain/models/movie.dart';
import 'package:cinebox_app_flutter/domain/usecases/extensions/mark_favorite_extension.dart';

class GetMoviesBySearchUsecase {
  final TmdbRepository _tmdbRepository;
  final MoviesRepository _moviesRepository;

  GetMoviesBySearchUsecase({
    required TmdbRepository tmdbRepository,
    required MoviesRepository moviesRepository,
  }) : _tmdbRepository = tmdbRepository,
       _moviesRepository = moviesRepository;


  Future<Result<List<Movie>>> execute({required String search}) async {
    final results = await Future.wait([
      _moviesRepository.getMyFavoritesMovies(),
      _tmdbRepository.getMoviesBySearch(query: search),
    ]);

    if (results case [
      Success<List<FavoriteMovie>>(value: final favorites),
      Success<List<Movie>>(value: final movies),
    ]) {
      final favoritesIDs = favorites.map((f) => f.id).toList();
      return Success(movies.markAsFavorite(favoritesIDs));
    }

    return Failure(Exception('Erro ao buscar filmes por nome'));
  }
}
