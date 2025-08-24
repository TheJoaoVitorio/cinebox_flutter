import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/domain/models/movie.dart';

abstract interface class TmdbRepository {
  Future<Result<List<Movie>>> getPopularMovies({
    String language = 'pt-BR',
    int page = 1,
  });
}
