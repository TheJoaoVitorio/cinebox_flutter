import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/data/models/genre/genre.dart';
import 'package:cinebox_app_flutter/domain/models/movie.dart';

abstract interface class TmdbRepository {
  Future<Result<List<Movie>>> getPopularMovies({
    String language = 'pt-BR',
    int page = 1,
  });

  Future<Result<List<Movie>>> getTopRatedMovies({
    String language = 'pt-BR',
    int page = 1,
  });

  Future<Result<List<Movie>>> getNowPlayingMovies({
    String language = 'pt-BR',
    int page = 1,
  });

  Future<Result<List<Movie>>> getUpComingMovies({
    String language = 'pt-BR',
    int page = 1,
  });

  Future<Result<List<Genre>>> getGenries();

  Future<Result<List<Movie>>> getMoviesByGenre({required int genreId});

  Future<Result<List<Movie>>> getMoviesBySearch({required String query});
}
